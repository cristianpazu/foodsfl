import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/WEB/Domain/repositories/productoRepositories/productoRepositories.dart';
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/productoImpl/ProductoServiceIMPL.dart';
import 'package:foodsfl/WEB/Infrastructure/repository-controller/productosController/producto_repository_controller.dart';

final produtoProvider = Provider<Productorepositories>((ref) {
  final productoRepository = ProductoRepositoryController(Productoserviceimpl());

  return productoRepository;
});

