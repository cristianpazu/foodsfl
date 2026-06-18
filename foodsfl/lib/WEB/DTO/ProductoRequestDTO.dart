import 'package:foodsfl/WEB/DTO/SubMenuRequestDTO.dart';

class ProductoRequestdto {
  int idProducto;
  String nombre;
  String descripcion;
  int precio;
  bool activo;
  SubmenuRequestdto submenuRequestdto;

ProductoRequestdto({
 
 required this.idProducto,
 required this.nombre,
 required this.descripcion,
 required this.precio,
 required this.activo,
 required this.submenuRequestdto

});

 factory ProductoRequestdto.fromJson(Map<String, dynamic> json) {
    return ProductoRequestdto(
      idProducto: json['idProducto'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      activo: json['activo'],
      submenuRequestdto: SubmenuRequestdto.fromJson(
  json['submenu'],
),
   
    );
   
  }


 Map<String, dynamic> toJson() => {
        "idProducto": idProducto,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "activo":activo,
        "submenuRequestdto":submenuRequestdto.toJson()
      };


  
}