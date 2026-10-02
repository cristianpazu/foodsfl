import 'package:foodsfl/WEB/DTO/EstadoPedidoDTO.dart';
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart';
import 'package:foodsfl/WEB/DTO/PedidoCocinaDTO.dart' show PedidoCocinaDto;

class Pedidostate {
  final int? idpedido;
  final bool? isLoding;
  final List<Historialpedidodto>? historialpedidodto;
  final List<PedidoCocinaDto>? pedidos;
   final List<Estadopedidodto>? estadoPedido;

  Pedidostate({this.idpedido, this.isLoding, this.historialpedidodto, this.pedidos, this.estadoPedido});

  Pedidostate copyWith(
          {int? idpedido,
          bool? isLoding,
          List<Historialpedidodto>? historialpedidodto,
          List<Estadopedidodto>? estadoPedido,
    List<PedidoCocinaDto>? pedidos,}) =>
      Pedidostate(
          idpedido: idpedido ?? this.idpedido,
          isLoding: isLoding ?? this.isLoding,
          historialpedidodto: historialpedidodto ?? this.historialpedidodto,
          pedidos: pedidos ?? this.pedidos,
          estadoPedido: estadoPedido ?? this.estadoPedido
          );
}
