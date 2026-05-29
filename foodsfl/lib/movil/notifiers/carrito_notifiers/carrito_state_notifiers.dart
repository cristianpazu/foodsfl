import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/DTO/CarritoItemDTO.dart';
import 'package:foodsfl/movil/DTO/ProductoDTO.dart';
import 'package:foodsfl/movil/notifiers/carrito_notifiers/carritoState.dart';

final carritoStateNotifier =
    StateNotifierProvider<CarritoStateNotifiers, Carritostate>(
  (ref) => CarritoStateNotifiers(),
);

class CarritoStateNotifiers extends StateNotifier<Carritostate> {
  CarritoStateNotifiers()
      : super(
          Carritostate(items: []),
        );

  void agregarProducto(ProductoDTO producto) {
    final existe = state.items.indexWhere(
      (e) => e.idProducto == producto.id,
    );

    if (existe >= 0) {
      state.items[existe].cantidad++;

      state = state.copyWith(
        items: [...state.items],
      );
    } else {
      final item = CarritoItemDTO(
        idProducto: producto.id,
        nombre: producto.nombre,
        precio: producto.precio,
        cantidad: 1,
      );

      state = state.copyWith(
        items: [...state.items, item],
      );
    }
  }

void agregarCantidad(int idProducto) {

  final nuevosItems = state.items.map((item) {

    if (item.idProducto == idProducto) {

      return item.copyWith(
        cantidad: item.cantidad + 1,
      );
    }

    return item;

  }).toList();

  state = state.copyWith(
    items: nuevosItems,
  );
}


  void disminuirCantidad(int idProducto) {

  final index = state.items.indexWhere(
    (e) => e.idProducto == idProducto,
  );

  if (index == -1) return;

  final item = state.items[index];

  if (item.cantidad > 1) {

    item.cantidad--;

    state = state.copyWith(
      items: [...state.items],
    );

  } 
}

void eliminarProducto(int idProducto) {

  state = state.copyWith(
    items: state.items
        .where((e) => e.idProducto != idProducto)
        .toList(),
  );
}

void limpiarCarrito(){
  state = state.copyWith(
    items: []
  );
}

}
