/*import 'package:foodsfl/WEB/DTO/EstadoPedidoDTO.dart';
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/WEB/Domain/repositories/pedidoRepositories/pedidoRepositories.dart' show Pedidorepositories;
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/pedidoImpl/PedidoServiceIMPL.dart' show Pedidoserviceimpl; */

import 'package:foodsfl/v2/WEB2/DTO/EstadoPedidoDTO.dart' show Estadopedidodto;
import 'package:foodsfl/v2/WEB2/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/v2/WEB2/DTO/PedidoResponseDTO.dart' show PedidoResponseDTO;
import 'package:foodsfl/v2/WEB2/DTO/PedidosResponseDTO.dart';
import 'package:foodsfl/v2/WEB2/Domain/repositories/pedidoRepositories/pedidoRepositories.dart' show Pedidorepositories;
import 'package:foodsfl/v2/WEB2/Infrastructure/datasource-ServiceIMPL/pedidoImpl/PedidoServiceIMPL.dart' show Pedidoserviceimpl;

class PedidoRepositoryController extends Pedidorepositories {

  final Pedidoserviceimpl pedidoserviceimpl;

   PedidoRepositoryController(this.pedidoserviceimpl);


  @override
  Future<List<PedidosResponseDTO>> consultarPedidosActuales() {

final ufff = pedidoserviceimpl.consultarPedidosActuales();

print('uffff ${ufff}');

   return ufff;
  }

  @override
  Future<List<Estadopedidodto>> consultarEstadoPedido() {
   final estadoPedido = pedidoserviceimpl.consultarEstadoPedido();
print('estadoPedido ${estadoPedido}');
   return estadoPedido;
  }

  @override
  Future actualizarEstadoPago(int idPedido, int idEstadoPago) {
    return pedidoserviceimpl.actualizarEstadoPago(idPedido,idEstadoPago);
  }
}