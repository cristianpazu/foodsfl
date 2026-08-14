import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart';

class Pedidostate {
  final int? idpedido;
  final bool? isLoding;
  final List<Historialpedidodto>? historialpedidodto;

  Pedidostate({this.idpedido, this.isLoding, this.historialpedidodto});

  Pedidostate copyWith(
          {int? idpedido,
          bool? isLoding,
          List<Historialpedidodto>? historialpedidodto}) =>
      Pedidostate(
          idpedido: idpedido ?? this.idpedido,
          isLoding: isLoding ?? this.isLoding,
          historialpedidodto: historialpedidodto ?? this.historialpedidodto);
}
