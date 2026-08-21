import 'dart:convert';

import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/WEB/Domain/datasource-serviceInterface/pedidoInterface/pedidoDatasource.dart' show Pedidodatasource;
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart' show HttpService;

class Pedidoserviceimpl extends Pedidodatasource {

 
  
  @override
   Future<List<Historialpedidodto>> consultarPedidosActuales(String fecha, int idEstado) async {
   try {
      final respuesta = await HttpService(Baseurl.consultarPedidosActuals(fecha, idEstado)).getHttp();

  
    print('🔵 RESPUESTA RAW: $respuesta');
    print('🔵 TIPO RESPUESTA: ${respuesta.runtimeType}');


      if (respuesta == null) return [];

      final data = jsonDecode(respuesta);
       print('🟢 DATA: $data');
    print('🟢 TIPO DATA: ${data.runtimeType}');
 if (data is! List) {
      print('❌ La respuesta no es una lista');
      return [];
    }
      final List<Historialpedidodto> peidos = [];

      for (var element in data ?? []) {
 print('🟡 ELEMENT: $element');
      print('🟡 TIPO ELEMENT: ${element.runtimeType}');
        
       // peidos.add(Historialpedidodto.fromJson(element));

       if (element is Map<String, dynamic>) {
        peidos.add(
          Historialpedidodto.fromJson(element),
        );
      } else {
        print('❌ Elemento no es Map<String,dynamic>');
      }
        
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
