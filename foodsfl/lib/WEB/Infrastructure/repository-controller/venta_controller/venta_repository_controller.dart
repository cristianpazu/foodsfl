import 'package:foodsfl/WEB/DTO/VentaDTO.dart';
import 'package:foodsfl/WEB/Domain/repositories/ventaRepositories/ventaRepositories.dart' show Ventarepositories;
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/ventaImpl/VentaServiceIMPL.dart';

class VentaRepositoryController extends Ventarepositories {

    final Ventaserviceimpl ventaserviceimpl;

   VentaRepositoryController(this.ventaserviceimpl);
  @override
  Future<Ventadto> consultarVentaHoy() {
   final venta = ventaserviceimpl.consultarVentaHoy();

   return venta;
  }



   
}