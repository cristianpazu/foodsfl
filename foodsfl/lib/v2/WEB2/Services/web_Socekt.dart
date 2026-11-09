import 'dart:convert' show jsonDecode;

import 'package:stomp_dart_client/stomp_dart_client.dart';

class WebSocketService {
  late StompClient stompClient;

  void conectar({
    required Function(Map<String, dynamic>) onPedidoNuevo,
    required Function(Map<String, dynamic>) onPedidoPagado,
  }) {
    stompClient = StompClient(
      config: StompConfig.sockJS(
        url: 'http://192.168.1.132:8080/ws',
        onConnect: (StompFrame frame) {
          print('WebSocket conectado');

          stompClient.subscribe(
            destination: '/topic/pedidos',
            callback: (frame) {
              print('📦 MENSAJE RECIBIDO');
              if (frame.body == null) return;

              print('PEDIDO NUEVO: ${frame.body}');

              final data = jsonDecode(frame.body!);

              print('🔥 TIPO DATA: ${data.runtimeType}');

              onPedidoNuevo(data);
            },
          );

          stompClient.subscribe(
            destination: '/topic/pedido-estado',
            callback: (frame) {
              try{
              if (frame.body == null) return;

              final data = jsonDecode(frame.body!);

               print('🔥 data type: ${data.runtimeType}');
      print('🔥 data: $data');

        if (data is! Map) {
        print('❌ El mensaje no es un objeto JSON');
        return;
      }

      final datas = Map<String, dynamic>.from(data);
              onPedidoPagado(
                datas
              );
            }catch (e, stack) {
      print('❌ Error procesando pedido-estado: $e');
      print(stack);
    }
     }

          );
        },
        onWebSocketError: (dynamic error) {
          print('WebSocket error: $error');
        },
      ),
    );

    stompClient.activate();
  }

  void desconectar() {
    stompClient.deactivate();
  }
}
