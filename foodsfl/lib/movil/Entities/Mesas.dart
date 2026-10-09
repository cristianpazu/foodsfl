class Mesas {
  int? idMesas;
  String? nombre;
  int? capacidad;
  bool? disponibilidad;

  Mesas({required this.idMesas, this.nombre, this.capacidad ,this.disponibilidad});

  factory Mesas.fromJson(Map<String, dynamic> json) => Mesas(
      idMesas: json["idMesas"] ?? 0,
      nombre: json["nombre"],
      capacidad: json["capacidad"] ?? 0,
      disponibilidad: json["disponibilidad"]);

  Map<String, dynamic> toJson() => {
        "idMesas": idMesas,
        "nombre": nombre,
        "capacidad": capacidad,
        "disponibilidad": disponibilidad,
      };
}
