class Ventadto {
  int? pedidosHoy;

  int? totalVendido;
int? productosVendidos;


  Ventadto({this.pedidosHoy, this.totalVendido, this.productosVendidos});

  factory Ventadto.fromJson(Map<String, dynamic> json) {
    return Ventadto(
      pedidosHoy: (json['pedidosHoy'] as num).toInt(),
      totalVendido: (json['totalVendido'] as num).toInt(),
      productosVendidos: (json['productosVendidos'] as num).toInt(),
    );
  }
}