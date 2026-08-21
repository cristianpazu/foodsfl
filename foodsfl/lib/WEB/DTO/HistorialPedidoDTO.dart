
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
     idPedido: (json['idPedido'] as num).toInt(),
    nombreMesa: json['nombreMesa']?.toString() ?? '',
    nombreProducto: json['nombreProducto']?.toString() ?? '',
    precio: (json['precio'] as num).toInt(),
    fecha: json['fecha']?.toString() ?? '',
    cantidad: (json['cantidad'] as num).toInt(),
    hora: json['hora']?.toString() ?? '',
    totalCuenta: (json['totalCuenta'] as num).toInt(),
    );
  }
}
