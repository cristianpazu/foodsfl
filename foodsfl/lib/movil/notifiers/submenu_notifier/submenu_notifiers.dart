
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/Domain/repositories/subMenuRepositories/SubMenuRepositories.dart';
import 'package:foodsfl/movil/Entities/SubMenu.dart';
import 'package:foodsfl/movil/notifiers/submenu_notifier/submenu_state.dart';
import 'package:foodsfl/movil/providers/submenu_providers.dart';

final subMenuStateNotifierProvider =
    StateNotifierProvider<SubMenuNotifiers, SubMenuState>((ref) {
  final subMenuResposityController = ref.watch(submenuProvider);

  return SubMenuNotifiers(submenurepositories: subMenuResposityController);
});

class SubMenuNotifiers extends StateNotifier<SubMenuState> {
  final Submenurepositories submenurepositories;

  SubMenuNotifiers({required this.submenurepositories})
      : super(SubMenuState()) {
    ConsultarSubMemu();
  }

  Future ConsultarSubMemu() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final List<SubMenu> subMenu = await submenurepositories.consultarSubmenu();

    state = state.copyWith(isLoding: false, submenu: [...?state.submenu, ...subMenu]);
  }
}