import 'package:foodsfl/movil/DTO/ProductoPedidoDTO.dart';

class PedidoItemDTO {

  final ProductoPedidoDTO productos;
  final int cantidad;

  PedidoItemDTO({
    required this.productos,
    required this.cantidad,
  });

  Map<String, dynamic> toJson() {

    return {
      "productos": productos.toJson(),
      "cantidad": cantidad,
    };
  }
}