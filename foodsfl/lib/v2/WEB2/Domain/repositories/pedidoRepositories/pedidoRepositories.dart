

import 'package:foodsfl/v2/WEB2/DTO/EstadoPedidoDTO.dart' show Estadopedidodto;
import 'package:foodsfl/v2/WEB2/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/v2/WEB2/DTO/PedidoResponseDTO.dart' show PedidoResponseDTO;

abstract class Pedidorepositories {
  Future<List<PedidoResponseDTO>> consultarPedidosActuales();
  Future<List<Estadopedidodto>> consultarEstadoPedido();
  Future<void> actualizarEstadoPago(int idPedido, int idEstadoPago);
}