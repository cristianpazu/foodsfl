import 'package:foodsfl/movil/DTO/RestauranteDTO.dart';
import 'package:foodsfl/movil/Domain/repositories/restauranteRepositories/RestauranteRepositories.dart';
import 'package:foodsfl/movil/Infrastructure/datasource-ServiceIMPL/restauranteImpl/RestauranteIMPL.dart';

class RestuarantesRepositoryController implements Restauranterepositories {

  Restauranteimpl restauranteimpl;

 RestuarantesRepositoryController(this.restauranteimpl);


  @override
  Future<RestauranteDTO> consultarRestaurante(int id) {
   return restauranteimpl.consultarRestaurante(id);

  }
}