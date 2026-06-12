import 'package:foodsfl/WEB/DTO/ProductoResponseDTO.dart';
import 'package:foodsfl/movil/Entities/Productos.dart';

abstract class Productorepositories {
 Future<List<ProductoResponseDTO>> consultarProductos();



}