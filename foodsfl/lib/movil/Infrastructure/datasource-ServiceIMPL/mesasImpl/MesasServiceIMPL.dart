import 'package:foodsfl/movil/Domain/datasourse-serviceInterface/mesasInterface/MesasDatasource.dart';
import 'package:foodsfl/movil/Entities/Mesas.dart';
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart';

class Mesasserviceimpl  extends Mesasdatasource{
  @override
  Future<List<Mesas>> getAllComidaRapida() async {
    try{
   final respuesta = await HttpService(Baseurl.consultarCategoria).getHttp();

print('respuestarespuesta $respuesta');

      final List<Mesas> mesas = [];

      print('object respuesta $respuesta');
      for (var element in respuesta ?? []) {
        print('object element $element');

        mesas.add(Mesas.fromJson(element));
      }


      return mesas;


    } catch (e) {
      print('Error: $e');
      return []; // O puedes lanzar una excepción si prefieres
    }
  }

 }