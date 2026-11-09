
class Historialpedidodto {
  final int idPedido;

  final String nombreMesa;

  final String nombreProducto;

  final int precio;

  final int cantidad;

  final String fecha;

  final String hora;

  final int totalCuenta;
  
  final String estadoPago;


  Historialpedidodto({
    required this.idPedido,
    required this.nombreMesa,
    required this.nombreProducto,
    required this.precio,
    required this.cantidad,
    required this.fecha,
    required this.hora,
    required this.totalCuenta,
    required this.estadoPago
  });

  factory Historialpedidodto.fromJson(Map<String, dynamic> json) {
    final estadoPago = json['estadoPago'];
    return Historialpedidodto(
     idPedido: (json['idPedido'] as num).toInt(),
    nombreMesa: json['nombreMesa']?.toString() ?? '',
    nombreProducto: json['nombreProducto']?.toString() ?? '',
    precio: (json['precio'] as num).toInt(),
    fecha: json['fecha']?.toString() ?? '',
    cantidad: (json['cantidad'] as num).toInt(),
    hora: json['hora']?.toString() ?? '',
    totalCuenta: (json['totalCuenta'] as num).toInt(),
    estadoPago: estadoPago is Map
          ? estadoPago['nombre']?.toString() ?? ''
          : estadoPago?.toString() ?? '',
    // estadoPago: json['estadoPago']?.toString() ?? '',
    );
  }
}
