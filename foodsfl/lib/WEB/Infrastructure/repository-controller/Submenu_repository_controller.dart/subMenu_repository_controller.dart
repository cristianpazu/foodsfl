import 'package:foodsfl/WEB/DTO/SubMenuResponseDTO.dart';
import 'package:foodsfl/WEB/Domain/repositories/subMenuRepositories/subMenuRepositories.dart';
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/subMenuImpl/SubMenuServiceIMPL.dart';

class SubmenuRepositoryController extends Submenurepositories {

  final Submenuserviceimpl submenuserviceimpl;

   SubmenuRepositoryController(this.submenuserviceimpl);


  @override
  Future<List<Submenuresponsedto>> consultarSubmenuAll() {
   return submenuserviceimpl.consultarSubmenuAll();
  }
}