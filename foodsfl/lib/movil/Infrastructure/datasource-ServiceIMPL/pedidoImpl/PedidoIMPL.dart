import 'package:foodsfl/movil/DTO/PedidoDTO.dart';
import 'package:foodsfl/movil/Domain/datasourse-serviceInterface/pedidoInterface/PedidoDatasource.dart';
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart';

class Pedidoimpl implements Pedidodatasource{
  @override
  Future<void> registrarPedido(PedidoDTO pedidoDto) async{
    try {
      final respuesta = await HttpService(Baseurl.registrarPedido).postRegisterHttp(pedidoDto.toJson());
     print('respuesta>>>>>>>>>>>>><<<<<< ${pedidoDto.toJson()}');
print('respuesta>>>>>>>>>>>>><<<<<< $respuesta');

      return respuesta;
    } catch (_) {
       throw Exception(
      'Error registrando pedido',
    );
    }
  }
}