
import 'package:foodsfl/movil/DTO/PedidoDTO.dart';
import 'package:foodsfl/movil/Domain/repositories/pedidoRepositories/PedidoRepositories.dart';
import 'package:foodsfl/movil/Infrastructure/datasource-ServiceIMPL/pedidoImpl/PedidoIMPL.dart';

class PedidoRepositoryController implements Pedidorepositories {

  Pedidoimpl pedidoimpl;

 PedidoRepositoryController(this.pedidoimpl);

  @override
  Future<void> registrarPedido(PedidoDTO pedidoDto) {
    return pedidoimpl.registrarPedido(pedidoDto);
  }


}