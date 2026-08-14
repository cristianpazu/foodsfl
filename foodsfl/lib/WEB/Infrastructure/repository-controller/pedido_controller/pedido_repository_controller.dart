import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/WEB/Domain/repositories/pedidoRepositories/pedidoRepositories.dart' show Pedidorepositories;
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/pedidoImpl/PedidoServiceIMPL.dart' show Pedidoserviceimpl;

class PedidoRepositoryController extends Pedidorepositories {

  final Pedidoserviceimpl pedidoserviceimpl;

   PedidoRepositoryController(this.pedidoserviceimpl);


  @override
  Future<List<Historialpedidodto>> consultarPedidosActuales(String fecha, int idEstado) {

final ufff = pedidoserviceimpl.consultarPedidosActuales( fecha,  idEstado);

print('uffff ${ufff}');

   return ufff;
  }
}