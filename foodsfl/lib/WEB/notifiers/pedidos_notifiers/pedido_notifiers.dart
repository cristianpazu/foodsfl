
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifierProvider, StateNotifier;
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/WEB/Domain/repositories/pedidoRepositories/pedidoRepositories.dart' show Pedidorepositories;
import 'package:foodsfl/WEB/notifiers/pedidos_notifiers/pedido_State.dart';
import 'package:foodsfl/WEB/providers/pedido_provider.dart' show pedidoProvider;
import 'package:foodsfl/WEB/widget/sistema.dart' show Sistema;

final pedidotateNotifierProvider =
    StateNotifierProvider<PedidoNotifiers, Pedidostate>((ref) {
  final pedidoResposityController = ref.watch(pedidoProvider);

  return PedidoNotifiers(pedidorepositories: pedidoResposityController);
});

class PedidoNotifiers extends StateNotifier<Pedidostate> {
  final Pedidorepositories pedidorepositories;

  PedidoNotifiers({required this.pedidorepositories})
      : super(Pedidostate()) {
    ConsultarPedidosActuales();
  }

  Future ConsultarPedidosActuales() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final List<Historialpedidodto> pedido = await pedidorepositories.consultarPedidosActuales(  Sistema.formatoFecha(Sistema.fechaActual()),1);

print('111111111 $pedido');


    state = state.copyWith(isLoding: false, historialpedidodto: [...?state.historialpedidodto, ...pedido]);
  }
}