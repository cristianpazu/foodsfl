import 'package:foodsfl/WEB/DTO/EstadoPedidoDTO.dart' show Estadopedidodto;
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;

abstract class Pedidorepositories {
  Future<List<Historialpedidodto>> consultarPedidosActuales(String fecha, int id);
  Future<List<Estadopedidodto>> consultarEstadoPedido();
}