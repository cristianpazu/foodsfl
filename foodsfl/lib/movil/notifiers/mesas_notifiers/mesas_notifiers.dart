import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/Domain/repositories/mesasRepositories/MesasRepositories.dart';
import 'package:foodsfl/movil/Entities/Mesas.dart';
import 'package:foodsfl/movil/notifiers/mesas_notifiers/mesas_state.dart';
import 'package:foodsfl/movil/providers/mesas_providers.dart';

final mesasStateNotifierProvider =
    StateNotifierProvider<MesasNotifiers, MesasState>((ref) {
  final mesasResposityController = ref.watch(mesasProvider);

  return MesasNotifiers(mesasControllerREposituroy: mesasResposityController);
});

class MesasNotifiers extends StateNotifier<MesasState> {
  final Mesasrepositories mesasControllerREposituroy;

  MesasNotifiers({required this.mesasControllerREposituroy})
      : super(MesasState()) {
    ConsultarMesas();
  }

  Future ConsultarMesas() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final List<Mesas> mesas = await mesasControllerREposituroy.getAllMesas();

    state = state.copyWith(isLoding: false, mesas:mesas);
  }


  
}
