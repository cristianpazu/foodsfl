

import 'package:foodsfl/v2/WEB2/DTO/EstadoPedidoDTO.dart' show Estadopedidodto;
import 'package:foodsfl/v2/WEB2/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/v2/WEB2/DTO/PedidoResponseDTO.dart' show PedidoResponseDTO;
import 'package:foodsfl/v2/WEB2/DTO/PedidosResponseDTO.dart';

abstract class Pedidodatasource {

  Future<List<PedidosResponseDTO>> consultarPedidosActuales();

  Future<List<Estadopedidodto>> consultarEstadoPedido();

  Future<void> actualizarEstadoPago(int idPedido, int idEstadoPago);
  
}