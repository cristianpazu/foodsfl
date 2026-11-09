


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/v2/WEB2/DTO/SubMenuResponseDTO.dart' show Submenuresponsedto;
import 'package:foodsfl/v2/WEB2/Domain/repositories/subMenuRepositories/subMenuRepositories.dart' show Submenurepositories;
import 'package:foodsfl/v2/WEB2/notifiers/submenu_notifiers/submenu_state.dart' show SubMenuState;
import 'package:foodsfl/v2/WEB2/providers/subMenus_provider.dart' show submenuProvider;/*
import 'package:foodsfl/WEB/DTO/SubMenuResponseDTO.dart';
import 'package:foodsfl/WEB/Domain/repositories/subMenuRepositories/subMenuRepositories.dart';
import 'package:foodsfl/WEB/notifiers/submenu_notifiers/submenu_state.dart';
import 'package:foodsfl/WEB/providers/subMenus_provider.dart'; */

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

    final List<Submenuresponsedto> subMenu = await submenurepositories.consultarSubmenuAll();

    state = state.copyWith(isLoding: false, submenu: [...?state.submenu, ...subMenu]);
  }
}