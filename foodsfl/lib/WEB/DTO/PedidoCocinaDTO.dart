import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;

class PedidoCocinaDto {
  final int idPedido;
  final int idMesa;
  final String nombreMesa;
  final String fecha;
  final String hora;
  final int totalCuenta;
  final int idEstado;
  final String estado;
  final List<Historialpedidodto> items;

  PedidoCocinaDto({
    required this.idPedido,
    required this.idMesa,
    required this.nombreMesa,
    required this.fecha,
    required this.hora,
    required this.totalCuenta,
    required this.idEstado,
    required this.estado,
    required this.items,
  });

 factory PedidoCocinaDto.fromJson(Map<String, dynamic> json) {
  print('========== PEDIDO DTO ==========');
  print('idPedido: ${json['idPedido']}');
  print('mesas: ${json['mesas']}');
  print('fecha: ${json['fecha']}');
  print('hora: ${json['hora']}');
  print('totalCuenta: ${json['totalCuenta']}');
  print('estadoPago: ${json['estadoPago']}');
  print('items: ${json['items']}');

  final mesa =
      Map<String, dynamic>.from(json['mesas'] ?? {});

  final estadoPago =
      Map<String, dynamic>.from(json['estadoPago'] ?? {});

  print('idMesa: ${mesa['idMesas']}');
  print('idEstado: ${estadoPago['idEstado']}');

  final List<dynamic> itemsJson =
      json['items'] as List<dynamic>? ?? [];

  return PedidoCocinaDto(
    idPedido:
        (json['idPedido'] as num).toInt(),

    idMesa:
        (mesa['idMesas'] as num).toInt(),

    nombreMesa:
        mesa['nombre']?.toString() ?? '',

    fecha:
        json['fecha']?.toString() ?? '',

    hora:
        json['hora']?.toString() ?? '',

    totalCuenta:
        (json['totalCuenta'] as num).toInt(),

    idEstado:
        (estadoPago['idEstado'] as num).toInt(),

    estado:
        estadoPago['nombre']?.toString() ?? '',

    items: itemsJson.map((item) {
      return Historialpedidodto.fromJson(
        Map<String, dynamic>.from(item),
      );
    }).toList(),
  );
}
}