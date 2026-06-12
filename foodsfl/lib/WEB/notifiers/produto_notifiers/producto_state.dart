import 'package:foodsfl/WEB/DTO/ProductoResponseDTO.dart';
import 'package:foodsfl/movil/Entities/Mesas.dart';
import 'package:foodsfl/movil/Entities/Productos.dart';

class ProductoState {
  final int? idProducto;
  final bool? isLoding;
  final List<ProductoResponseDTO>? producto;

  ProductoState({this.idProducto, this.isLoding, this.producto = const []});

  ProductoState copyWith({int? idProducto, bool? isLoding, List<ProductoResponseDTO>? producto}) =>
      ProductoState(
          idProducto: idProducto ?? this.idProducto,
          isLoding: isLoding ?? this.isLoding,
          producto: producto ?? this.producto);
}
