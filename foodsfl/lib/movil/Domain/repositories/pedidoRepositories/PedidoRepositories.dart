import 'package:foodsfl/movil/DTO/PedidoDTO.dart';

abstract class Pedidorepositories {
    Future<void> registrarPedido(PedidoDTO pedidoDto);
}