import 'package:foodsfl/movil/DTO/MenuDTO.dart';

class SubmenuRequestdto {
 int idSubmen;
  String nombre;
  bool activo;
 // MenuDTO menu;

  SubmenuRequestdto({
    required this.idSubmen,
    required this.nombre,
    required this.activo
   // required menu.toString()
  });

 factory SubmenuRequestdto.fromJson(Map<String, dynamic> json) {
    return SubmenuRequestdto(
      idSubmen: json['idProducto'],
      nombre: json['nombre'],
      activo: json['activo'],
   
   
    );
   
  }



 Map<String, dynamic> toJson() => {
        "idSubmen": idSubmen,
        "nombre": nombre,
        "activo":activo,
      };


}