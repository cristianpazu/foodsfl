import 'package:foodsfl/WEB/DTO/VentaDTO.dart';

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
