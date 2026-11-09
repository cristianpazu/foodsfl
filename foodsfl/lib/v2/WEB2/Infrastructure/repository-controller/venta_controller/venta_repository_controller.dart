/*import 'package:foodsfl/WEB/DTO/VentaDTO.dart';
import 'package:foodsfl/WEB/Domain/repositories/ventaRepositories/ventaRepositories.dart' show Ventarepositories;
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/ventaImpl/VentaServiceIMPL.dart'; */

import 'package:foodsfl/v2/WEB2/DTO/VentaDTO.dart';
import 'package:foodsfl/v2/WEB2/Domain/repositories/ventaRepositories/ventaRepositories.dart' show Ventarepositories;
import 'package:foodsfl/v2/WEB2/Infrastructure/datasource-ServiceIMPL/ventaImpl/VentaServiceIMPL.dart' show Ventaserviceimpl;

class VentaRepositoryController extends Ventarepositories {

    final Ventaserviceimpl ventaserviceimpl;

   VentaRepositoryController(this.ventaserviceimpl);
  @override
  Future<Ventadto> consultarVentaHoy() {
   final venta = ventaserviceimpl.consultarVentaHoy();

   return venta;
  }



   
}