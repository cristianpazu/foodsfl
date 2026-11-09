

import 'package:foodsfl/v2/WEB2/DTO/ProductoResponseDTO.dart';

abstract class ProductoDatasource {

Future< List<ProductoResponseDTO>> consultarProductos ();

}

