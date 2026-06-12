import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/WEB/DTO/ProductoResponseDTO.dart';
import 'package:foodsfl/WEB/Domain/repositories/productoRepositories/productoRepositories.dart';
import 'package:foodsfl/WEB/Infrastructure/repository-controller/productosController/producto_repository_controller.dart';
import 'package:foodsfl/WEB/notifiers/produto_notifiers/producto_state.dart';
import 'package:foodsfl/WEB/providers/producto_provider.dart';
import 'package:foodsfl/movil/Domain/repositories/mesasRepositories/MesasRepositories.dart';
import 'package:foodsfl/movil/Entities/Mesas.dart';
import 'package:foodsfl/movil/Entities/Productos.dart';
import 'package:foodsfl/movil/notifiers/mesas_notifiers/mesas_state.dart';
import 'package:foodsfl/movil/providers/mesas_providers.dart';

final productoStateNotifierProvider =
    StateNotifierProvider<ProductoNotifiers, ProductoState>((ref) {
  final productoResposityController = ref.watch(produtoProvider);

  return ProductoNotifiers(productoControllerREposituroy:  productoResposityController);
});

class ProductoNotifiers extends StateNotifier<ProductoState> {
  final Productorepositories productoControllerREposituroy;

  ProductoNotifiers({required this.productoControllerREposituroy})
      : super(ProductoState()) {
    consultarProductos();
  }

  Future consultarProductos() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final List<ProductoResponseDTO> producto = await productoControllerREposituroy.consultarProductos();

    state = state.copyWith(isLoding: false, producto:producto);
  }


  
}
 
