class ProductoPedidoDTO {

  final int idProductos;

  ProductoPedidoDTO({
    required this.idProductos,
  });

  Map<String, dynamic> toJson() {

    return {
      "idProductos": idProductos,
    };
  }
}