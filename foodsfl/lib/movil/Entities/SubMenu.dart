import 'package:foodsfl/movil/Entities/Menu.dart';
import 'package:foodsfl/movil/Entities/Productos.dart';

class SubMenu {

 int? idSubmenu;

 String? nombre;

 bool? activo;

 Menu? menu;

 List<Productos>? productos;

 SubMenu({
  this.idSubmenu,
  this.nombre,
  this.activo,
  this.menu,
  this.productos
  
 });
 factory SubMenu.fromJson(Map<String, dynamic> json) =>SubMenu(
 idSubmenu: json["id_submenu"],
 nombre: json["nombre"],
 activo: json["activo"],
 menu: json["menu"],
 productos:  json["productos"] != null
            ? (json["productos"] as List)
                .map((e) => Productos.fromJson(e))
                .toList()
            : [],
 
 );
Map<String, dynamic> toJson() => {
        "id_submenu": idSubmenu,
        "nombre": nombre,
        "activo": activo,
        "menu": menu,
          "productos": productos?.map((e) => e.toJson()).toList(),
      };


 

}
