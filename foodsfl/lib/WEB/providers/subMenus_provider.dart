import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/WEB/Domain/repositories/subMenuRepositories/subMenuRepositories.dart';
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/subMenuImpl/SubMenuServiceIMPL.dart';
import 'package:foodsfl/WEB/Infrastructure/repository-controller/Submenu_repository_controller.dart/subMenu_repository_controller.dart';

final submenuProvider = Provider<Submenurepositories>((ref) {
  final subMenuRepository = SubmenuRepositoryController(Submenuserviceimpl());

  return subMenuRepository;
});