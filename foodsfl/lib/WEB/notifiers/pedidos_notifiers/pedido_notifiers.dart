import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateNotifierProvider, StateNotifier;
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart'
    show Historialpedidodto;
import 'package:foodsfl/WEB/Domain/repositories/pedidoRepositories/pedidoRepositories.dart'
    show Pedidorepositories;
import 'package:foodsfl/WEB/Services/web_Socekt.dart' show WebSocketService;
import 'package:foodsfl/WEB/notifiers/pedidos_notifiers/pedido_State.dart';
import 'package:foodsfl/WEB/providers/pedido_provider.dart' show pedidoProvider;
import 'package:foodsfl/WEB/widget/sistema.dart' show Sistema;

final pedidotateNotifierProvider =
    StateNotifierProvider<PedidoNotifiers, Pedidostate>((ref) {
  final pedidoResposityController = ref.watch(pedidoProvider);

  return PedidoNotifiers(pedidorepositories: pedidoResposityController);
});

class PedidoNotifiers extends StateNotifier<Pedidostate> {
  final Pedidorepositories pedidorepositories;
  final WebSocketService webSocketService =
      WebSocketService();

  PedidoNotifiers({required this.pedidorepositories}) : super(Pedidostate()) {
    ConsultarPedidosActuales();
     conectarWebSocket();
  }

  Future ConsultarPedidosActuales() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);
  try {

    final List<Historialpedidodto> pedido =
        await pedidorepositories.consultarPedidosActuales(
            Sistema.formatoFecha(Sistema.fechaActual()), 1);

    print('111111111 $pedido');

    state = state.copyWith(
        isLoding: false,
        historialpedidodto: [...?state.historialpedidodto, ...pedido]);

  } catch (e, stackTrace) {
    print('❌ ERROR ConsultarPedidosActuales: $e');
    print('STACKTRACE: $stackTrace');

    state = state.copyWith(isLoding: false);
  }
}
void conectarWebSocket() {

   print('🔥 CONECTANDO WEBSOCKET - NOTIFIER: ${hashCode}');
  webSocketService.conectar(
    onPedidoNuevo: (data) {
      try {
     print('========== WS INICIO ==========');
    print('DATA TYPE: ${data.runtimeType}');
    print('DATA: $data');

        final Map<String, dynamic> pedido =
            Map<String, dynamic>.from(data as Map);
             print('1 OK');


        final Map<String, dynamic> mesa =
            Map<String, dynamic>.from(
          pedido['mesas'] as Map,
        );
print('2 OK');
        final List<dynamic> items =
            pedido['items'] as List<dynamic>? ?? [];

         print('3 OK - ITEMS: ${items.length}');
        final nuevosPedidos =
            items.map<Historialpedidodto>((item) {
                print('4 ITEM: $item');
          final Map<String, dynamic> itemMap =
              Map<String, dynamic>.from(item as Map);

          final Map<String, dynamic> producto =
              Map<String, dynamic>.from(
            itemMap['productos'] as Map,
          );

         print('5 PRODUCTO: ${producto['nombre']}');

          return Historialpedidodto(
            idPedido: (pedido['idPedido'] as num).toInt(),
            nombreMesa: mesa['nombre']?.toString() ?? '',
            nombreProducto:
                producto['nombre']?.toString() ?? '',
            precio: (producto['precio'] as num).toInt(),
            cantidad: (itemMap['cantidad'] as num).toInt(),
            fecha: pedido['fecha']?.toString() ?? '',
            hora: pedido['hora']?.toString() ?? '',
            totalCuenta:
                (pedido['totalCuenta'] as num).toInt(),
          );
        }).toList();
  print('6 OK - PEDIDOS CREADOS');
      

        state = state.copyWith(
          historialpedidodto: [
            ...nuevosPedidos,
            ...?state.historialpedidodto,
          ],
        );
        print('7 OK - STATE ACTUALIZADO');
    print('========== WS FIN ==========');
      } catch (e, stackTrace) {
        print('❌ ERROR PROCESANDO WEBSOCKET: $e');
        print(stackTrace);
      }
    },
  );
}

}

/*
  void conectarWebSocket() {
try{
    webSocketService.conectar(
      onPedidoNuevo: (data) {

       print('🔥 NUEVO PEDIDO: $data');

  print('ID PEDIDO: ${data['idPedido']}');
  print('MESA: ${data['mesas']['nombre']}');

       final List<dynamic> items = data['items'] ?? [];
final nuevosPedidos = items.map<Historialpedidodto>((item) {
  final producto = item['productos'];

  return Historialpedidodto(
    idPedido: (data['idPedido'] as num).toInt(),
    nombreMesa: data['mesas']['nombre'].toString(),
    nombreProducto: producto['nombre'].toString(),
    precio: (producto['precio'] as num).toInt(),
    cantidad: (item['cantidad'] as num).toInt(),
    fecha: data['fecha'].toString(),
    hora: data['hora'].toString(),
    totalCuenta: (data['totalCuenta'] as num).toInt(),
  );
}).toList();

state = state.copyWith(
  historialpedidodto: [
    ...nuevosPedidos,
    ...?state.historialpedidodto,
  ],
);
      
}
       
      
    );
  

  @override
  void dispose() {

    webSocketService.desconectar();

    super.dispose();
  }
  
} catch (e, stackTrace) {
    print('❌ ERROR ConsultarPedidosActuales: $e');
    print('STACKTRACE: $stackTrace');

    state = state.copyWith(isLoding: false);
  }
  }
} */
