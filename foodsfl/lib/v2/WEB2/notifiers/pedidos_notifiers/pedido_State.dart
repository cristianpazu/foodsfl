/*import 'package:foodsfl/WEB/DTO/EstadoPedidoDTO.dart';
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart';
import 'package:foodsfl/WEB/DTO/PedidoCocinaDTO.dart' show PedidoCocinaDto; */

import 'package:foodsfl/v2/WEB2/DTO/EstadoPedidoDTO.dart';
import 'package:foodsfl/v2/WEB2/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/v2/WEB2/DTO/PedidoCocinaDTO.dart' show PedidoCocinaDto;
import 'package:foodsfl/v2/WEB2/DTO/PedidoResponseDTO.dart' show PedidoResponseDTO;
import 'package:foodsfl/v2/WEB2/DTO/PedidosResponseDTO.dart';

class Pedidostate {
  final int? idpedido;
  final bool? isLoding;
  final bool? isLodingCaja;
  final bool? isLodingEstadoPedido;
  final List<Historialpedidodto>? historialpedidodto;
  final List<PedidoResponseDTO>? pedidoResponseDTO;
    final List<PedidosResponseDTO>? pedidosResponseDTO;

  
  final List<PedidoCocinaDto>? pedidos;
   final List<Estadopedidodto>? estadoPedido;
   final String? estadoPedidoS;


  Pedidostate({this.idpedido, this.isLoding, this.isLodingCaja, this.isLodingEstadoPedido, this.historialpedidodto, this.pedidoResponseDTO , this.pedidosResponseDTO,this.pedidos, this.estadoPedido, this.estadoPedidoS});

  Pedidostate copyWith(
          {int? idpedido,
          bool? isLoding,
          bool? isLodingCaja,
          bool? isLodingEstadoPedido,
          List<Historialpedidodto>? historialpedidodto,
           List<PedidoResponseDTO>? pedidoResponseDTO,
             List<PedidosResponseDTO>? pedidosResponseDTO,
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
          pedidoResponseDTO: pedidoResponseDTO ?? this.pedidoResponseDTO,
          pedidosResponseDTO: pedidosResponseDTO ?? this.pedidosResponseDTO,
          pedidos: pedidos ?? this.pedidos,
          estadoPedido: estadoPedido ?? this.estadoPedido,
          estadoPedidoS: estadoPedidoS ?? this.estadoPedidoS
          );
}
