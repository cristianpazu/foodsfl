import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;

abstract class Pedidorepositories {
  Future<List<Historialpedidodto>> consultarPedidosActuales(String fecha, int id);
}