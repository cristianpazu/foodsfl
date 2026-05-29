import 'package:foodsfl/movil/DTO/MenuDTO.dart';

class RestauranteDTO {
  final int id;
  final String nombres;
  final List<MenuDTO> menus;

  RestauranteDTO({
    required this.id,
    required this.nombres,
    required this.menus,
  });

  factory RestauranteDTO.fromJson(Map<String, dynamic> json) {
    return RestauranteDTO(
      id: json['id'],
      nombres: json['nombres'],
      menus: (json['menus'] as List)
          .map((e) => MenuDTO.fromJson(e))
          .toList(),
    );
  }
}