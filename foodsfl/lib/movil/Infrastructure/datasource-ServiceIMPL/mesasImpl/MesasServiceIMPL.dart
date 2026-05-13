import 'dart:convert';

import 'package:foodsfl/movil/Domain/datasourse-serviceInterface/mesasInterface/MesasDatasource.dart';
import 'package:foodsfl/movil/Entities/Mesas.dart';
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart';

class Mesasserviceimpl extends Mesasdatasource {
  @override
  Future<List<Mesas>> getAllMesas() async {
    try {
      final respuesta = await HttpService(Baseurl.consultarMesas).getHttp();
      if (respuesta == null) return [];

      final data = jsonDecode(respuesta);
      final List<Mesas> mesas = [];

      for (var element in data ?? []) {
        mesas.add(Mesas.fromJson(element));
      }

      return mesas;
    } catch (_) {
      return [];
    }
  }
}
