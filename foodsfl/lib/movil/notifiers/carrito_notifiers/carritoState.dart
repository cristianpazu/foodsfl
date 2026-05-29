import 'package:foodsfl/movil/DTO/CarritoItemDTO.dart';

class Carritostate {


final List<CarritoItemDTO> items;

  Carritostate({
    required this.items,
  });

  int get total {

    return items.fold(
      0,
      (sum, item) => sum + item.total,
    );
  }

  Carritostate copyWith({
    List<CarritoItemDTO>? items,
  }) {

    return Carritostate(
      items: items ?? this.items,
    );
  }
}