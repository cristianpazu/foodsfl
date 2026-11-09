import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart' show MasonryGridView;
import 'package:foodsfl/v2/WEB2/DTO/PedidoResponseDTO.dart' show PedidoResponseDTO;
import 'package:foodsfl/v2/WEB2/Widgets/cardPedido.dart' show CardPedidos;
import 'package:foodsfl/v2/WEB2/notifiers/pedidos_notifiers/pedido_notifiers.dart' show pedidotateNotifierProvider;

class Pedidospage extends ConsumerStatefulWidget {
  const Pedidospage({super.key});

  @override
  _PedidospagepageState createState() => _PedidospagepageState();
}

class _PedidospagepageState extends ConsumerState {
  int? subMenuSeleccionado;
  String textoBusqueda = '';
  @override
  Widget build(BuildContext context) {
    final pedido = ref.watch(pedidotateNotifierProvider);

    print('>>>>>>>>>>>>>>>>>>>>< ${pedido.historialpedidodto?.length}');


  final historial = pedido.pedidoResponseDTO ?? [];

  final Map<int, List<PedidoResponseDTO>> pedidosAgrupados = {};

for (final item in historial) {
  pedidosAgrupados.putIfAbsent(item.idPedido!, () => []);
  pedidosAgrupados[item.idPedido]!.add(item);
}

final pedidosUnicos = pedidosAgrupados.values.toList();

/*
    final productosFiltrados = productos.producto?.where((producto) {
          if (subMenuSeleccionado == null) {
            return true;
          }

          return producto.idSubmenu == subMenuSeleccionado;
        }).toList() ??
        []; */

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
                hintText: 'Buscar pedidosssssssssss...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: /* SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
  child: SizedBox(
    width: double.infinity,
    child: Wrap(
     alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
  spacing: 20,       // espacio horizontal
  runSpacing: 20,    // espacio vertical
      children: List.generate(
        pedidosUnicos.length,
        (index) {
          final productosPedido = pedidosUnicos[index];
    
          final primerProducto = productosPedido.first;
    
          return SizedBox(
            width: 200,
            child: CardPedidos(
              idProducto: primerProducto.idPedido,
              nombreMesa: primerProducto.nombreMesa,
              productos: productosPedido,
            ),
          );
        },
      ),
    ),
  ),
) */

            
            
            
            MasonryGridView.count(
               /* gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // número de columnas
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ), */

 crossAxisCount: 6,
  mainAxisSpacing: 20,
  crossAxisSpacing: 20,
  padding: const EdgeInsets.all(20),
                itemCount:pedidosUnicos.length, //pedido.historialpedidodto?.length ?? 0,
                itemBuilder: (context, index) {
                  /*
                    final producto = productos.producto![index];
                    print(producto.idSubmenu); */

                  final pedidos = pedido.pedidoResponseDTO![index];

                  print(pedido.pedidoResponseDTO?.length);

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
                      CardPedidos(
                        idProducto: primerProducto.idPedido!,
                        nombreMesa: primerProducto.descripcion,
                        productos: productosPedido
                        
                        
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



