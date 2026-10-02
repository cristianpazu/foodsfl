import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart' show MasonryGridView;
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart' show Historialpedidodto;
import 'package:foodsfl/WEB/notifiers/pedidos_notifiers/pedido_notifiers.dart'
    show pedidotateNotifierProvider;
import 'package:foodsfl/WEB/notifiers/produto_notifiers/producto_notifiers.dart';
import 'package:foodsfl/WEB/notifiers/submenu_notifiers/submenu_notifiers.dart';
import 'package:foodsfl/WEB/screen/Forms/ProductoFormModal.dart';
import 'package:foodsfl/WEB/widget/sistema.dart';
import 'package:foodsfl/Widgets/cardPedido.dart';
import 'package:foodsfl/Widgets/cardPedidos.dart' show CardPedidos2;
import 'package:foodsfl/Widgets/cardProductos.dart';

class Cajapage extends ConsumerStatefulWidget {
  const Cajapage({super.key});

  @override
  _CajapagepageState createState() => _CajapagepageState();
}

class _CajapagepageState extends ConsumerState {
  int? subMenuSeleccionado;
  String textoBusqueda = '';
  @override
  Widget build(BuildContext context) {
    final pedido = ref.watch(pedidotateNotifierProvider);

    print('|||||||||||||||||||||||||| ${pedido.estadoPedido?.length}');


  final historial = pedido.historialpedidodto ?? [];

  final Map<int, List<Historialpedidodto>> pedidosAgrupados = {};

for (final item in historial) {
  pedidosAgrupados.putIfAbsent(item.idPedido, () => []);
  pedidosAgrupados[item.idPedido]!.add(item);
}

final pedidosUnicos = pedidosAgrupados.values.toList();



    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  textoBusqueda = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar pedido...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: 

            
            
            
            MasonryGridView.count(
               

 crossAxisCount: 6,
  mainAxisSpacing: 20,
  crossAxisSpacing: 20,
  padding: const EdgeInsets.all(20),
                itemCount:pedidosUnicos.length, //pedido.historialpedidodto?.length ?? 0,
                itemBuilder: (context, index) {
                  /*
                    final producto = productos.producto![index];
                    print(producto.idSubmenu); */

                  final pedidos = pedido.historialpedidodto![index];

                  print(pedido.historialpedidodto?.length);

                    final productosPedido = pedidosUnicos[index];

      final primerProducto = productosPedido.first;

                  return /*Card(
  child: Column(
    children: [
      Text('Pedido: ${pedidos.idPedido}'),
      Text('Mesa: ${pedidos.nombreMesa}'),
      Text('Producto: ${pedidos.nombreProducto}'),
      Text('Cantidad: ${pedidos.cantidad}'),
    ],
  ),
); */ Column(
                    children: [ 
                      CardPedidos2(
                        idProducto: primerProducto.idPedido,
                        nombreMesa: primerProducto.nombreMesa,
                        productos: productosPedido,
                        totalCuenta: primerProducto.totalCuenta,
                        
                        
                        /*
                        nombreProducto: pedidos.nombreProducto,
                        cantidad: pedidos.cantidad, */
                      ),
                    ],
                  ); 
                }), 
          ),
        ],
      ),
    );
  }
}



