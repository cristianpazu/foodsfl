 import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/Domain/repositories/restauranteRepositories/RestauranteRepositories.dart';
import 'package:foodsfl/movil/Infrastructure/datasource-ServiceIMPL/restauranteImpl/RestauranteIMPL.dart';
import 'package:foodsfl/movil/Infrastructure/repository-controller/restauranteController/restuarantes_repository_controller.dart';

final restauranteProvider = Provider<Restauranterepositories>((ref) {
   final restauranteRepository =  RestuarantesRepositoryController(Restauranteimpl());
  return restauranteRepository;
 }); 