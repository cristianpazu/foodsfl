
class Historialpedidodto {
  final int idPedido;

  final String nombreMesa;

  final String nombreProducto;

  final int precio;

  final int cantidad;

  final String fecha;

  final String hora;

  final int totalCuenta;
  Historialpedidodto({
    required this.idPedido,
    required this.nombreMesa,
    required this.nombreProducto,
    required this.precio,
    required this.cantidad,
    required this.fecha,
    required this.hora,
    required this.totalCuenta,
  });

  factory Historialpedidodto.fromJson(Map<String, dynamic> json) {
    return Historialpedidodto(
      idPedido: json['idPedido'],
      nombreMesa: json['nombreMesa'],
      nombreProducto: json['nombreProducto'],
      precio: json['precio'],
      fecha: json['fecha'],
      cantidad: json['cantidad'],
      hora: json['hora'],
      totalCuenta: json['totalCuenta'],
    );
  }
}
