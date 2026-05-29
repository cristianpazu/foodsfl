import 'package:foodsfl/movil/DTO/RestauranteDTO.dart';

abstract class Restaurantedatasource {

 Future <RestauranteDTO> consultarRestaurante(int id);


}
