import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/WEB/DTO/SubMenuResponseDTO.dart';

abstract class Pedidodatasource {

  Future<List<Historialpedidodto>> consultarPedidosActuales(String fecha, int id);
}