
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/DTO/RestauranteDTO.dart';
import 'package:foodsfl/movil/Domain/repositories/restauranteRepositories/RestauranteRepositories.dart';
import 'package:foodsfl/movil/Domain/repositories/subMenuRepositories/SubMenuRepositories.dart';
import 'package:foodsfl/movil/Entities/SubMenu.dart';
import 'package:foodsfl/movil/notifiers/restaurante_notifiers/restaurante_state.dart';
import 'package:foodsfl/movil/notifiers/submenu_notifier/submenu_state.dart';
import 'package:foodsfl/movil/providers/restaurante_providers.dart';
import 'package:foodsfl/movil/providers/submenu_providers.dart';

final restaurantetateNotifierProvider =
    StateNotifierProvider<RestauranteNotifiers, RestauranteState>((ref) {
  final restauranteResposityController = ref.watch(restauranteProvider);

  return RestauranteNotifiers(restauranterepositories: restauranteResposityController);
});

class RestauranteNotifiers extends StateNotifier<RestauranteState> {
  final Restauranterepositories restauranterepositories;

  RestauranteNotifiers({required this.restauranterepositories})
      : super(RestauranteState(idRestaurante: 1)) {
    consultarRestaurante();
  }

  Future<void> consultarRestaurante() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final RestauranteDTO restauranteDTO = await restauranterepositories.consultarRestaurante(1);

    state = state.copyWith(isLoding: false, restauranteDTO: restauranteDTO);
  }
}