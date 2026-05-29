import 'package:foodsfl/movil/DTO/ProductoDTO.dart';

class SubMenuDTO {
  final int idSubmenu;
  final String nombre;
  final List<ProductoDTO> productos;

  SubMenuDTO({
    required this.idSubmenu,
    required this.nombre,
    required this.productos,
  });

  factory SubMenuDTO.fromJson(Map<String, dynamic> json) {
    return SubMenuDTO(
      idSubmenu: json['idSubmenu'],
      nombre: json['nombre'],
      productos: (json['productos'] as List)
          .map((e) => ProductoDTO.fromJson(e))
          .toList(),
    );
  }
}