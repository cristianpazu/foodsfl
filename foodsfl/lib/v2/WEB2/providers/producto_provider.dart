import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/v2/WEB2/Domain/repositories/productoRepositories/productoRepositories.dart' show Productorepositories;
import 'package:foodsfl/v2/WEB2/Infrastructure/datasource-ServiceIMPL/productoImpl/ProductoServiceIMPL.dart' show Productoserviceimpl;
import 'package:foodsfl/v2/WEB2/Infrastructure/repository-controller/productosController/producto_repository_controller.dart' show ProductoRepositoryController;/*
import 'package:foodsfl/WEB/Domain/repositories/productoRepositories/productoRepositories.dart';
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/productoImpl/ProductoServiceIMPL.dart';
import 'package:foodsfl/WEB/Infrastructure/repository-controller/productosController/producto_repository_controller.dart'; */

final produtoProvider = Provider<Productorepositories>((ref) {
  final productoRepository = ProductoRepositoryController(Productoserviceimpl());

  return productoRepository;
});

