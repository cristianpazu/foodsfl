import 'package:foodsfl/WEB/DTO/VentaDTO.dart' show Ventadto;

abstract class Ventadatasource {


  Future<Ventadto> consultarVentaHoy();
  
}