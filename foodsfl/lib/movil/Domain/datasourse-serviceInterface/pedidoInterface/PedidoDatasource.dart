import 'package:foodsfl/movil/DTO/PedidoDTO.dart';

abstract class Pedidodatasource {

  Future<void> registrarPedido(PedidoDTO pedidoDto);

}