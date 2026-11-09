/*import 'package:foodsfl/WEB/DTO/SubMenuResponseDTO.dart';
import 'package:foodsfl/WEB/Domain/repositories/subMenuRepositories/subMenuRepositories.dart';
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/subMenuImpl/SubMenuServiceIMPL.dart'; */

import 'package:foodsfl/v2/WEB2/DTO/SubMenuResponseDTO.dart' show Submenuresponsedto;
import 'package:foodsfl/v2/WEB2/Domain/repositories/subMenuRepositories/subMenuRepositories.dart' show Submenurepositories;
import 'package:foodsfl/v2/WEB2/Infrastructure/datasource-ServiceIMPL/subMenuImpl/SubMenuServiceIMPL.dart' show Submenuserviceimpl;

class SubmenuRepositoryController extends Submenurepositories {

  final Submenuserviceimpl submenuserviceimpl;

   SubmenuRepositoryController(this.submenuserviceimpl);


  @override
  Future<List<Submenuresponsedto>> consultarSubmenuAll() {
   return submenuserviceimpl.consultarSubmenuAll();
  }
}