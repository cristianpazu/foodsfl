import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/Domain/repositories/mesasRepositories/MesasRepositories.dart';
import 'package:foodsfl/movil/Infrastructure/datasource-ServiceIMPL/mesasImpl/MesasServiceIMPL.dart';
import 'package:foodsfl/movil/Infrastructure/repository-controller/MesasController/mesas_repository_controller.dart';

final mesasProvider = Provider<Mesasrepositories>((ref) {
  final mesasRepository = ComidaRepositoryController(Mesasserviceimpl());

  return mesasRepository;
});
