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
 
 );


}
