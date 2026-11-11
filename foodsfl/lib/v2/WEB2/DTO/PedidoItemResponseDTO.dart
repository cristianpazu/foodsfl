class PedidoItemResponseDTO {
  String? nombre;
  String? descripcion;
  int? precio;
  int? cantidad;
  int? precioUnitario;

  PedidoItemResponseDTO({
    this.nombre,
    this.descripcion,
    this.precio,
    this.cantidad,
    this.precioUnitario,
  });

  factory PedidoItemResponseDTO.fromJson(Map<String, dynamic> json) {
    return PedidoItemResponseDTO(
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      cantidad: json['cantidad'],
      precioUnitario: json['precioUnitario'],
    );
  }
}