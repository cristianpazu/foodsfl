import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/Domain/repositories/pedidoRepositories/PedidoRepositories.dart';
import 'package:foodsfl/movil/Domain/repositories/restauranteRepositories/RestauranteRepositories.dart';
import 'package:foodsfl/movil/Infrastructure/datasource-ServiceIMPL/pedidoImpl/PedidoIMPL.dart';
import 'package:foodsfl/movil/Infrastructure/datasource-ServiceIMPL/restauranteImpl/RestauranteIMPL.dart';
import 'package:foodsfl/movil/Infrastructure/repository-controller/PedidoController/pedido_repository_controller.dart';

final pedidoProvider = Provider<Pedidorepositories>((ref) {
   final pedidoRepository =  PedidoRepositoryController(Pedidoimpl());
  return pedidoRepository;
 }); 