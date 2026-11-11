import 'package:foodsfl/v2/WEB2/DTO/PedidoItemResponseDTO.dart';

class PedidosResponseDTO {
  int? idPedido;
  String? nombreCliente;
  String? direccionEntrega;
  String? telefonoCliente;

  DateTime? fecha;
  String? hora;

  String? metodoPago;
  int? totalCuenta;

  List<PedidoItemResponseDTO>? items;

  PedidosResponseDTO({
    this.idPedido,
    this.nombreCliente,
    this.direccionEntrega,
    this.telefonoCliente,
    this.fecha,
    this.hora,
    this.metodoPago,
    this.totalCuenta,
    this.items,
  });

  factory PedidosResponseDTO.fromJson(Map<String, dynamic> json) {
    return PedidosResponseDTO(
      idPedido: json['idPedido'],
      nombreCliente: json['nombreCliente'],
      direccionEntrega: json['direccionEntrega'],
      telefonoCliente: json['telefonoCliente'],
      fecha: json['fecha'] != null
          ? DateTime.parse(json['fecha'])
          : null,
      hora: json['hora'],
      metodoPago: json['metodoPago'],
      totalCuenta: json['totalCuenta'],
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => PedidoItemResponseDTO.fromJson(item))
          .toList() ?? [],
    );
  }
}