class Estadopedidodto {
  int? idEstado;

  String? nombre;

  Estadopedidodto({this.idEstado, this.nombre});

  factory Estadopedidodto.fromJson(Map<String, dynamic> json) {
    return Estadopedidodto(
      idEstado: (json['idEstado'] as num).toInt(),
      nombre: json['nombre']?.toString() ?? '',
    );
  }
}
