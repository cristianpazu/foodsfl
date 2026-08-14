
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:foodsfl/WEB/Domain/repositories/pedidoRepositories/pedidoRepositories.dart' show Pedidorepositories;
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/pedidoImpl/PedidoServiceIMPL.dart' show Pedidoserviceimpl;
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/subMenuImpl/SubMenuServiceIMPL.dart' show Submenuserviceimpl;
import 'package:foodsfl/WEB/Infrastructure/repository-controller/pedido_controller/pedido_repository_controller.dart' show PedidoRepositoryController;


final pedidoProvider = Provider<Pedidorepositories>((ref) {
  final pedidoRepository = PedidoRepositoryController(Pedidoserviceimpl());

  return pedidoRepository;
});