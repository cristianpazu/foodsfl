class Mesas {
  int? idMesas;
  String? nombre;
  bool? disponibilidad;

  Mesas({required this.idMesas, this.nombre, this.disponibilidad});

  factory Mesas.fromJson(Map<String, dynamic> json) => Mesas(
      idMesas: json["idMesas"] ?? 0,
      nombre: json["nombre"],
      disponibilidad: json["disponibilidad"]);

  Map<String, dynamic> toJson() => {
        "idMesas": idMesas,
        "nombre": nombre,
        "disponibilidad": disponibilidad,
      };
}
