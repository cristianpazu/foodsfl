import 'dart:convert';

import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/WEB/DTO/SubMenuResponseDTO.dart';
import 'package:foodsfl/WEB/Domain/datasource-serviceInterface/pedidoInterface/pedidoDatasource.dart' show Pedidodatasource;
import 'package:foodsfl/WEB/Domain/datasource-serviceInterface/subMenuInterface/subMenuDatasource.dart';
import 'package:foodsfl/movil/DTO/PedidoDTO.dart';
import 'package:foodsfl/movil/Entities/SubMenu.dart';
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart' show HttpService;

class Pedidoserviceimpl extends Pedidodatasource {

 
  
  @override
   Future<List<Historialpedidodto>> consultarPedidosActuales(String fecha, int idEstado) async {
   try {
      final respuesta = await HttpService(Baseurl.consultarPedidosActuals(fecha, idEstado)).getHttp();

   print('object $respuesta');


      if (respuesta == null) return [];

      final data = jsonDecode(respuesta);
      final List<Historialpedidodto> peidos = [];

      for (var element in data ?? []) {
 print('peidospeidos $element');
        
        peidos.add(Historialpedidodto.fromJson(element));
        
      }
 print('peidos $peidos');
      return peidos;
   } catch (e, stackTrace) {
  print('ERROR CONSULTANDO PEDIDOS: $e');
  print(stackTrace);
  return [];
}
  }

}
