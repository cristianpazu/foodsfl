
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifierProvider, StateNotifier;
import 'package:foodsfl/WEB/DTO/VentaDTO.dart';
import 'package:foodsfl/WEB/Domain/repositories/ventaRepositories/ventaRepositories.dart' show Ventarepositories;
import 'package:foodsfl/WEB/notifiers/pedidos_notifiers/pedido_State.dart' show Pedidostate;
import 'package:foodsfl/WEB/notifiers/venta_notifiers/venta_state.dart';
import 'package:foodsfl/WEB/providers/venta_provider.dart' show ventaProvider;

final ventatateNotifierProvider =
    StateNotifierProvider<VentaNotifiers, VentaState>((ref) {
  final ventaResposityController = ref.watch(ventaProvider);

  return VentaNotifiers(ventarepositories: ventaResposityController);
});

class VentaNotifiers extends StateNotifier<VentaState> {
  final Ventarepositories ventarepositories;


  VentaNotifiers({required this.ventarepositories}) : super(VentaState()) {
    consultarVentaHoy();
  }

 
   Future<void> consultarVentaHoy() async {
if (!mounted || state.isLoding == true) {
  print('🔴 NO HAGO PETICIÓN PORQUE ESTÁ CARGANDO');
  return;
}

    state = state.copyWith(isLoding: true);
    try{
      final Ventadto estadoVenta =
        await ventarepositories.consultarVentaHoy();

    print('>>>>>>>>>>>>>>>>< $estadoVenta');

       if (!mounted) return;

    state = state.copyWith(
        isLoding: false,
        estadoVenta: estadoVenta);

    }catch(_){

        if (!mounted) return;
    state = state.copyWith(isLoding: false);
    }

  
}



}

 
