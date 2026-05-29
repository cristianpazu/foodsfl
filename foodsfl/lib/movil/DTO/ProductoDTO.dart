class ProductoDTO {
  final int id;
  final String nombre;
  final String descripcion;
  final int precio;
  final bool activo;

  ProductoDTO({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.activo,
  });

  factory ProductoDTO.fromJson(Map<String, dynamic> json) {
    return ProductoDTO(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      activo: json['activo'],
    );
  }
}