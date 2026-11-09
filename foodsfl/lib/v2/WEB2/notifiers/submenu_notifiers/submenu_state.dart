

//import 'package:foodsfl/WEB/DTO/SubMenuResponseDTO.dart';

import 'package:foodsfl/v2/WEB2/DTO/SubMenuResponseDTO.dart' show Submenuresponsedto;

class SubMenuState {
  final int? idsubmenu;
  final bool? isLoding;
  final List<Submenuresponsedto>? submenu;

  SubMenuState({this.idsubmenu, this.isLoding, this.submenu = const []});

  SubMenuState copyWith({int? idsubmenu, bool? isLoding, List<Submenuresponsedto>? submenu}) =>
      SubMenuState(
          idsubmenu: idsubmenu ?? this.idsubmenu,
          isLoding: isLoding ?? this.isLoding,
          submenu: submenu ?? this.submenu);
}