import 'dart:convert' show jsonDecode;

import 'package:foodsfl/WEB/DTO/VentaDTO.dart';
import 'package:foodsfl/WEB/Domain/datasource-serviceInterface/ventaInterface/ventaDatasource.dart';
import 'package:foodsfl/movil/Utils/BaseUrl.dart' show Baseurl;
import 'package:foodsfl/movil/Utils/http.dart' show HttpService;

class Ventaserviceimpl extends Ventadatasource {




  @override
  Future<Ventadto> consultarVentaHoy()async {
 try {
      final  respuesta = await HttpService(Baseurl.consultarSubmenusPedidos).getHttp();
 
print('respuesta>>>>>>>>>>>>><<<<<< $respuesta');

    if (respuesta == null) {
      throw Exception('La respuesta del servidor es null');
    }

    return Ventadto.fromJson(jsonDecode(respuesta));
    } catch (_) {
       throw Exception(
      'Error registrando pedido',
    );
    }
  }

  
}