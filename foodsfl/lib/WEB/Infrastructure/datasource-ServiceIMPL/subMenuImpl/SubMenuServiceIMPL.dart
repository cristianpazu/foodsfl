import 'dart:convert';

import 'package:foodsfl/WEB/DTO/SubMenuResponseDTO.dart';
import 'package:foodsfl/WEB/Domain/datasource-serviceInterface/subMenuInterface/subMenuDatasource.dart';
import 'package:foodsfl/movil/Entities/SubMenu.dart';
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart';

class Submenuserviceimpl extends Submenudatasource {

  @override
  Future<List<Submenuresponsedto>> consultarSubmenuAll () async {
    try {
      final respuesta = await HttpService(Baseurl.consultarSubmenus).getHttp();
      if (respuesta == null) return [];

      final data = jsonDecode(respuesta);
      final List<Submenuresponsedto> subMenu = [];

      for (var element in data ?? []) {
        subMenu.add(Submenuresponsedto.fromJson(element));
      }

      return subMenu;
    } catch (_) {
      return [];
    }
  }
}
