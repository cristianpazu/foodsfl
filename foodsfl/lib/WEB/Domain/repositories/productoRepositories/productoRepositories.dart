import 'package:foodsfl/WEB/DTO/ProductoResponseDTO.dart';

abstract class Productorepositories {
 Future<List<ProductoResponseDTO>> consultarProductos();



}