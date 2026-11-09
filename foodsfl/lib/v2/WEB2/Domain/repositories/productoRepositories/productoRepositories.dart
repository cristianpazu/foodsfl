

import 'package:foodsfl/v2/WEB2/DTO/ProductoResponseDTO.dart';

abstract class Productorepositories {
 Future<List<ProductoResponseDTO>> consultarProductos();



}