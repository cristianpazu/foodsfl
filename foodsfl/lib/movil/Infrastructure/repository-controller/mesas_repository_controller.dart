import 'package:foodsfl/movil/Domain/repositories/MesasRepositories.dart';
import 'package:foodsfl/movil/Entities/Mesas.dart';
import 'package:foodsfl/movil/Infrastructure/datasource-ServiceIMPL/mesasImpl/MesasServiceIMPL.dart';

class ComidaRepositoryController extends Mesasrepositories{


  final Mesasserviceimpl mesasserviceimpl;


  ComidaRepositoryController(this.mesasserviceimpl);



  @override
  Future<List<Mesas>> getAllMesas() {
    return mesasserviceimpl.getAllComidaRapida();
  }
  
}