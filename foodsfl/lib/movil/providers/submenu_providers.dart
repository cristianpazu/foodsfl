import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/Domain/repositories/mesasRepositories/MesasRepositories.dart';
import 'package:foodsfl/movil/Domain/repositories/subMenuRepositories/SubMenuRepositories.dart';
import 'package:foodsfl/movil/Infrastructure/datasource-ServiceIMPL/submenuImpl/SubmernuIMPL.dart';
import 'package:foodsfl/movil/Infrastructure/repository-controller/subMenuController/submenu_repository_controller.dart';

final submenuProvider = Provider<Submenurepositories>((ref) {
  final subMenuRepository = SubmenuRepositoryController(Submenuimpl());

  return subMenuRepository;
});