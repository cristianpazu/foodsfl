class PedidoResponseDTO {
  final int? idPedido;
  final String? nombreCliente;
  final String? direccionEntrega;
  final String? telefonoCliente;

  final DateTime? fecha;
  final String? hora;

  final String? metodoPago;

  final String? nombre;
  final String? descripcion;
  final int? precio;

  final int? cantidad;

  final int? totalCuenta;
  final int? precioUnitario;

  PedidoResponseDTO({
    this.idPedido,
    this.nombreCliente,
    this.direccionEntrega,
    this.telefonoCliente,
    this.fecha,
    this.hora,
    this.metodoPago,
    this.nombre,
    this.descripcion,
    this.precio,
    this.cantidad,
    this.totalCuenta,
    this.precioUnitario,
  });

  factory PedidoResponseDTO.fromJson(Map<String, dynamic> json) {
    return PedidoResponseDTO(
      idPedido: json['idPedido'],
      nombreCliente: json['nombreCliente'],
      direccionEntrega: json['direccionEntrega'],
      telefonoCliente: json['telefonoCliente'],
      fecha: json['fecha'] != null
          ? DateTime.parse(json['fecha'])
          : null,
      hora: json['hora'],
      metodoPago: json['metodoPago'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'] != null
          ? (json['precio'] as num).toInt()
          : null,
      cantidad: json['cantidad'] != null
          ? (json['cantidad'] as num).toInt()
          : null,
      totalCuenta: json['totalCuenta'] != null
          ? (json['totalCuenta'] as num).toInt()
          : null,
      precioUnitario: json['precioUnitario'] != null
          ? (json['precioUnitario'] as num).toInt()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPedido': idPedido,
      'nombreCliente': nombreCliente,
      'direccionEntrega': direccionEntrega,
      'telefonoCliente': telefonoCliente,
      'fecha': fecha?.toIso8601String().split('T').first,
      'hora': hora,
      'metodoPago': metodoPago,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'cantidad': cantidad,
      'totalCuenta': totalCuenta,
      'precioUnitario': precioUnitario,
    };
  }
}