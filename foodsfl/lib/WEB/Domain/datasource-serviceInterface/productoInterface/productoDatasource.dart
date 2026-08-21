import 'package:foodsfl/WEB/DTO/ProductoResponseDTO.dart';

abstract class ProductoDatasource {

Future< List<ProductoResponseDTO>> consultarProductos ();

}

