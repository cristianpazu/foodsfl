import 'dart:convert';

import 'package:foodsfl/v2/WEB2/DTO/ProductoResponseDTO.dart' show ProductoResponseDTO;
import 'package:foodsfl/v2/WEB2/Domain/datasource-serviceInterface/productoInterface/productoDatasource.dart' show ProductoDatasource;
import 'package:foodsfl/v2/WEB2/Utils/BaseUrl.dart';
import 'package:foodsfl/v2/WEB2/Utils/http.dart';
/*
import 'package:foodsfl/WEB/DTO/ProductoResponseDTO.dart';
import 'package:foodsfl/WEB/Domain/datasource-serviceInterface/productoInterface/productoDatasource.dart'; 
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart';*/

class Productoserviceimpl extends ProductoDatasource {
  
  @override
  Future<List<ProductoResponseDTO>> consultarProductos() async {
    try {
      final respuesta = await HttpService(Baseurl.consultarProducto).getHttp();
      if (respuesta == null) return [];

      final data = jsonDecode(respuesta);
      final List<ProductoResponseDTO> producto= [];

      for (var element in data ?? []) {
        producto.add(ProductoResponseDTO.fromJson(element));
      }

      return producto;
    } catch (_) {
      return [];
    }
  }
}
