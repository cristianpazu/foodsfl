import 'package:foodsfl/movil/DTO/RestauranteDTO.dart';

abstract class Restauranterepositories {

Future <RestauranteDTO> consultarRestaurante(int id);

}