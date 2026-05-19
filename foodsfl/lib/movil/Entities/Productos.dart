import 'package:foodsfl/movil/Entities/SubMenu.dart';

class Productos {
int? idProductos;

String? Nombre;

String? Descripcion;

int? precio;

bool? activo;

SubMenu? subMenu;

 Productos({
  this.idProductos,
  this.Nombre,
  this.Descripcion,
  this.precio,
  this.activo,
  this.subMenu
  
 });

  factory Productos.fromJson(Map<String, dynamic> json) => Productos(
      idProductos: json["idProductos"] ?? 0,
      Nombre: json["nombre"],
      Descripcion: json["descripcion"],
      precio:  (json["precio"] ?? 0).toInt(),
      activo: json["activo"],
      subMenu: json["subMenu"] != null
            ? SubMenu.fromJson(json["subMenu"])
            : null,
  );

  Map<String, dynamic> toJson() => {
        "idProductos": idProductos,
        "nombre": Nombre,
        "descripcion": Descripcion,
         "precio": precio,
        "activo": activo,
        "subMenu": subMenu ?.toJson(),
      };
}