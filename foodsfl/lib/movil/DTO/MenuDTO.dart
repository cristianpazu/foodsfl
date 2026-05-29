import 'package:foodsfl/movil/DTO/SubMenuDTO.dart';

class MenuDTO {
  final String nombreMenu;
  final bool activo;
  final List<SubMenuDTO> submenu;

  MenuDTO({
    required this.nombreMenu,
    required this.activo,
    required this.submenu,
  });

  factory MenuDTO.fromJson(Map<String, dynamic> json) {
    return MenuDTO(
      nombreMenu: json['nombreMenu'],
      activo: json['activo'],
      submenu: (json['submenu'] as List)
          .map((e) => SubMenuDTO.fromJson(e))
          .toList(),
    );
  }
}