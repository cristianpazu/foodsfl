//import 'package:foodsfl/WEB/DTO/VentaDTO.dart';

import 'package:foodsfl/v2/WEB2/DTO/VentaDTO.dart' show Ventadto;

class VentaState {
  final int? idVenta;
  final bool? isLoding;

  final Ventadto? estadoVenta;

  VentaState({this.idVenta, this.isLoding, this.estadoVenta});

  VentaState copyWith({int? idVenta, bool? isLoding, Ventadto? estadoVenta}) =>
      VentaState(
          idVenta: idVenta ?? this.idVenta,
          isLoding: isLoding ?? this.isLoding,
          estadoVenta: estadoVenta ?? this.estadoVenta);
}
