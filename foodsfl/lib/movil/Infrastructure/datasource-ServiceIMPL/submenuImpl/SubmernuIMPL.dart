
import 'dart:convert';

import 'package:foodsfl/movil/Domain/datasourse-serviceInterface/subMenuInterface/SubMenuDatasource.dart';
import 'package:foodsfl/movil/Entities/SubMenu.dart';
import 'package:foodsfl/movil/Utils/BaseUrl.dart';
import 'package:foodsfl/movil/Utils/http.dart';

class  Submenuimpl extends Submenudatasource {
  @override
  Future<List<SubMenu>> consultarSubmenu() async {
     try {
      final respuesta = await HttpService(Baseurl.consultarSubMenu).getHttp();
      if (respuesta == null) return [];

      final data = jsonDecode(respuesta);
      final List<SubMenu> subMenu = [];

      for (var element in data ?? []) {
        subMenu.add(SubMenu.fromJson(element));
      }

      return subMenu;
    } catch (_) {
      return [];
    }
  }


}