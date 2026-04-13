import 'dart:ffi';

class Mesas {
  int? idMesas;
  String? nombre;
  Bool? disponabilidad;



  Mesas({required this.idMesas,
  this.nombre,
  this.disponabilidad
  });

 factory Mesas.fromJson(Map<String,dynamic> json) =>
 Mesas(idMesas: json["idMesas"]?? 0,
 nombre: json["nombre"],
 disponabilidad: json["disponibilidad"]);

Map<String, dynamic> toJson() => {
        "idMesas": idMesas,
        "nombre": nombre,
        "disponabilidad": disponabilidad,
        };
}


