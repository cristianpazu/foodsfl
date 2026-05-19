import 'package:foodsfl/movil/Domain/repositories/subMenuRepositories/SubMenuRepositories.dart';
import 'package:foodsfl/movil/Entities/SubMenu.dart';
import 'package:foodsfl/movil/Infrastructure/datasource-ServiceIMPL/submenuImpl/SubmernuIMPL.dart';

class SubmenuRepositoryController extends Submenurepositories {

 Submenuimpl submenuimpl;

SubmenuRepositoryController(this.submenuimpl);


  @override
  Future<List<SubMenu>> consultarSubmenu() {
    return submenuimpl.consultarSubmenu();
  }
}