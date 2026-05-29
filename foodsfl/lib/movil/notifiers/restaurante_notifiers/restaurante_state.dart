import 'package:foodsfl/movil/DTO/RestauranteDTO.dart';

class RestauranteState {
  final int? idRestaurante;
  final bool? isLoding;
  final RestauranteDTO? restauranteDTO;

  RestauranteState({this.idRestaurante, this.isLoding, this.restauranteDTO});

  RestauranteState copyWith(
          {int? idRestaurante,
          bool? isLoding,
          RestauranteDTO? restauranteDTO}) =>
      RestauranteState(
          idRestaurante: idRestaurante ?? this.idRestaurante,
          isLoding: isLoding ?? this.isLoding,
          restauranteDTO: restauranteDTO ?? this.restauranteDTO);
}
