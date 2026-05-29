import 'dart:convert';

import 'package:foodsfl/movil/DTO/RestauranteDTO.dart';
import 'package:foodsfl/movil/Domain/datasourse-serviceInterface/restauranteInterface/RestauranteDatasource.dart';
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart';

class Restauranteimpl implements Restaurantedatasource {
  @override
  Future<RestauranteDTO> consultarRestaurante(int id) async {
    try {
      final respuesta =
          await HttpService(Baseurl.consultarRestaurante(id)).getHttp();
  
    if (respuesta == null) {

      return RestauranteDTO(
        id: 0,
        nombres: '',
        menus: [],
      );
    }

        final data = jsonDecode(respuesta);

      return RestauranteDTO.fromJson(data);

    } catch (_) {
      rethrow;
    }
  }
}
