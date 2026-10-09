import 'package:foodsfl/WEB/DTO/VentaDTO.dart';

abstract class Ventarepositories {
 
  Future<Ventadto> consultarVentaHoy();
  
}