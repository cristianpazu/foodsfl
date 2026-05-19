import 'package:foodsfl/movil/Entities/SubMenu.dart';
import 'package:foodsfl/movil/notifiers/mesas_notifiers/mesas_state.dart';

class SubMenuState {
  final int? idsubmenu;
  final bool? isLoding;
  final List<SubMenu>? submenu;

  SubMenuState({this.idsubmenu, this.isLoding, this.submenu = const []});

  SubMenuState copyWith({int? idsubmenu, bool? isLoding, List<SubMenu>? submenu}) =>
      SubMenuState(
          idsubmenu: idsubmenu ?? this.idsubmenu,
          isLoding: isLoding ?? this.isLoding,
          submenu: submenu ?? this.submenu);
}