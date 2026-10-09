
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:foodsfl/WEB/Domain/repositories/ventaRepositories/ventaRepositories.dart';
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/ventaImpl/VentaServiceIMPL.dart' show Ventaserviceimpl;
import 'package:foodsfl/WEB/Infrastructure/repository-controller/venta_controller/venta_repository_controller.dart' show VentaRepositoryController;
import 'package:foodsfl/movil/Domain/repositories/pedidoRepositories/PedidoRepositories.dart' show Pedidorepositories;

final ventaProvider = Provider<Ventarepositories>((ref) {
  final ventaRepository = VentaRepositoryController(Ventaserviceimpl());

  return ventaRepository;
});