import 'package:foodsfl/WEB/DTO/EstadoPedidoDTO.dart';
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart';
import 'package:foodsfl/WEB/DTO/PedidoCocinaDTO.dart' show PedidoCocinaDto;

class Pedidostate {
  final int? idpedido;
  final bool? isLoding;
  final bool? isLodingCaja;
  final bool? isLodingEstadoPedido;
  final List<Historialpedidodto>? historialpedidodto;
  final List<PedidoCocinaDto>? pedidos;
   final List<Estadopedidodto>? estadoPedido;
   final String? estadoPedidoS;


  Pedidostate({this.idpedido, this.isLoding, this.isLodingCaja, this.isLodingEstadoPedido, this.historialpedidodto, this.pedidos, this.estadoPedido, this.estadoPedidoS});

  Pedidostate copyWith(
          {int? idpedido,
          bool? isLoding,
          bool? isLodingCaja,
          bool? isLodingEstadoPedido,
          List<Historialpedidodto>? historialpedidodto,
          List<Estadopedidodto>? estadoPedido,
    List<PedidoCocinaDto>? pedidos,
    String? estadoPedidoS
    }) =>
      Pedidostate(
          idpedido: idpedido ?? this.idpedido,
          isLoding: isLoding ?? this.isLoding,
          isLodingCaja: isLodingCaja ?? this.isLodingCaja,
          isLodingEstadoPedido: isLodingEstadoPedido ?? this.isLodingEstadoPedido,
          historialpedidodto: historialpedidodto ?? this.historialpedidodto,
          pedidos: pedidos ?? this.pedidos,
          estadoPedido: estadoPedido ?? this.estadoPedido,
          estadoPedidoS: estadoPedidoS ?? this.estadoPedidoS
          );
}
