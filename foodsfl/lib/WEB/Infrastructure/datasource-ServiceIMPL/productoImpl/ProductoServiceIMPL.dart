import 'dart:convert';

import 'package:foodsfl/WEB/DTO/ProductoResponseDTO.dart';
import 'package:foodsfl/WEB/Domain/datasource-serviceInterface/productoInterface/productoDatasource.dart';
import 'package:foodsfl/movil/Domain/datasourse-serviceInterface/mesasInterface/MesasDatasource.dart';
import 'package:foodsfl/movil/Entities/Mesas.dart';
import 'package:foodsfl/movil/Entities/Productos.dart';
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart';

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
