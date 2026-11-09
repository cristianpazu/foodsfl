import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/v2/WEB2/Domain/repositories/subMenuRepositories/subMenuRepositories.dart' show Submenurepositories;
import 'package:foodsfl/v2/WEB2/Infrastructure/datasource-ServiceIMPL/subMenuImpl/SubMenuServiceIMPL.dart' show Submenuserviceimpl;
import 'package:foodsfl/v2/WEB2/Infrastructure/repository-controller/Submenu_repository_controller.dart/subMenu_repository_controller.dart' show SubmenuRepositoryController;/*
import 'package:foodsfl/WEB/Domain/repositories/subMenuRepositories/subMenuRepositories.dart';
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/subMenuImpl/SubMenuServiceIMPL.dart';
import 'package:foodsfl/WEB/Infrastructure/repository-controller/Submenu_repository_controller.dart/subMenu_repository_controller.dart';*/

final submenuProvider = Provider<Submenurepositories>((ref) {
  final subMenuRepository = SubmenuRepositoryController(Submenuserviceimpl());

  return subMenuRepository;
});