import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'
    show MasonryGridView;
import 'package:foodsfl/WEB/DTO/EstadoPedidoDTO.dart' show Estadopedidodto;
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart'
    show Historialpedidodto;
import 'package:foodsfl/WEB/notifiers/pedidos_notifiers/pedido_notifiers.dart'
    show pedidotateNotifierProvider;
import 'package:foodsfl/Widgets/cardPedidos.dart' show CardPedidos2;

class Cajapage extends ConsumerStatefulWidget {
  const Cajapage({super.key});

  @override
  _CajapagepageState createState() => _CajapagepageState();
}

class _CajapagepageState extends ConsumerState {
  int? estadoPedido;
  String textoBusqueda = '';

  @override
  void initState() {
    super.initState();

    print('🟡 CAJA: initState');

    Future.microtask(() async {
      print('🟡 CAJA: antes de llamar método');

      await ref
          .read(pedidotateNotifierProvider.notifier)
          .consultarEstadoPedido();

      print('🟡 CAJA: después de llamar método');
    });
  }

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


    final estadosPedidoFiltrados = pedido.estadoPedido?.where((estadoPedidos) {
          final coincideEStadoPedido = estadoPedido == null ||
              estadoPedidos.idEstado == estadoPedido;

          final coincideTexto = estadoPedidos.nombre!
              .toLowerCase()
              .contains(textoBusqueda.toLowerCase());

          return coincideEStadoPedido && coincideTexto;
        }).toList() ??
        [];

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
          //
          
          const SizedBox(height: 20),
          Expanded(
            child: MasonryGridView.count(
                crossAxisCount: 6,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(20),
                itemCount: pedidosUnicos
                    .length, //pedido.historialpedidodto?.length ?? 0,
                itemBuilder: (context, index) {
                  /*
                    final producto = productos.producto![index];
                    print(producto.idSubmenu); */

                  final pedidos = pedido.historialpedidodto![index];

                  print(pedido.historialpedidodto?.length);

                  // final estadoPedido = pedido.estadoPedido![index];

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
); */
                      Column(
                    children: [
                      CardPedidos2(
                        idProducto: primerProducto.idPedido,
                        nombreMesa: primerProducto.nombreMesa,
                        productos: productosPedido,
                        totalCuenta: primerProducto.totalCuenta,
                        estadoPedido: primerProducto.estadoPago,
                        onPagar: () {
                          confirmarPagar(
                            context,
                            primerProducto.idPedido,
                            2
                          );
                        },
                        onCancelar: () {
                          confirmarCancelar(
                            context,
                            primerProducto.idPedido,
                            3
                          );
                        },

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

  Future<void> confirmarPagar(
    BuildContext context,
    int idPedido,
     int idEstadoPago
  ) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar pago'),
          content: Text(
            '¿Deseas marcar el pedido #$idPedido como pagado?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Pagar'),
            ),
          ],
        );
      },
    );

    if (confirmar == true) {
      // Aquí llamas al notifier/
      
    await ref
        .read(pedidotateNotifierProvider.notifier)
        .actualizarEstadoPedido(idPedido, 2); 
    }
  }

  Future<void> confirmarCancelar(
    BuildContext context,
    int idPedido,
    int idEstadoPago
  ) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancelar pedido'),
          content: Text(
            '¿Deseas cancelar el pedido #$idPedido?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Volver'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Cancelar pedido'),
            ),
          ],
        );
      },
    );

    if (confirmar == true) {
    
    await ref
        .read(pedidotateNotifierProvider.notifier)
        .actualizarEstadoPedido(idPedido,3);
    }
  }
}
