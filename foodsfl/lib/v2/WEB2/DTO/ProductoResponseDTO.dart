class ProductoResponseDTO {
  final int id;
  final String nombre;
  final String descripcion;
  final int precio;
  final bool activo;
  final int idSubmenu;

  ProductoResponseDTO({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.activo,
    required this.idSubmenu,
  });

  factory ProductoResponseDTO.fromJson(Map<String, dynamic> json) {
    return ProductoResponseDTO(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      activo: json['activo'],
      idSubmenu: json['idSubmenu']
    );
  }
}