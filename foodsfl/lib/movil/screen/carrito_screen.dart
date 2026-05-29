import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/DTO/MesasDTO.dart';
import 'package:foodsfl/movil/DTO/PedidoDTO.dart';
import 'package:foodsfl/movil/DTO/PedidoItemDTO.dart';
import 'package:foodsfl/movil/DTO/ProductoPedidoDTO.dart';
import 'package:foodsfl/movil/notifiers/carrito_notifiers/carrito_state_notifiers.dart';
import 'package:foodsfl/movil/notifiers/mesas_notifiers/mesas_notifiers.dart';
import 'package:foodsfl/movil/providers/pedido_providers.dart';
import 'package:foodsfl/movil/screen/mesas_screen.dart';

class CarritoPage extends ConsumerWidget {

  final int idMesa;

  const CarritoPage({
    super.key,
    required this.idMesa,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final carritoState = ref.watch(carritoStateNotifier);


    final pedidoProvider2 = ref.watch(pedidoProvider);
                     

    final carritoNotifier =
        ref.read(carritoStateNotifier.notifier);

    return Scaffold(

      appBar: AppBar(
        title: const Text('Mi Pedido'),
      ),

      body: carritoState.items.isEmpty

          ? const Center(
              child: Text('No hay productos'),
            )

          : ListView.builder(

              itemCount: carritoState.items.length,

              itemBuilder: (context, index) {

                final item =
                    carritoState.items[index];

                return Card(

                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),

                  child: Padding(

                    padding: const EdgeInsets.all(16),

                    child: Row(

                      children: [

                        Expanded(

                          child: Column(

                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                item.nombre,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                '\$${item.precio}',
                              ),

                              const SizedBox(height: 8),

                              Text(
                                'Total: \$${item.total}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(

                          children: [

                            IconButton(

                              onPressed: () {

                                carritoNotifier
                                    .disminuirCantidad(
                                  item.idProducto,
                                );
                              },

                              icon: const Icon(
                                Icons.remove_circle,
                              ),
                            ),

                            Text(
                              '${item.cantidad}',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),

                            IconButton(

                              onPressed: () {

                                carritoNotifier
                                    .agregarCantidad(
                                  item.idProducto,
                                ); 
                              },

                              icon: const Icon(
                                Icons.add_circle,
                              ),
                            ),
                            //

                            IconButton(

      onPressed: () {

        carritoNotifier
            .eliminarProducto(
          item.idProducto,
        );
      },

      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    ),



                            
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      bottomNavigationBar: Container(

        padding: const EdgeInsets.all(20),

        child: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            Row(

              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                const Text(
                  'TOTAL',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  '\$${carritoState.total}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(

              width: double.infinity,

              child: carritoState.items.isEmpty ? Container() : ElevatedButton(

                onPressed: () async {

         

                  final pedido = PedidoDTO(

                    mesas: Mesasdto(
                      idMesas: idMesa,
                    ),

                    items: carritoState.items.map((e) {

                      return PedidoItemDTO(

                        productos:
                            ProductoPedidoDTO(
                          idProductos:
                              e.idProducto,
                        ),

                        cantidad: e.cantidad,
                      );

                    }).toList(),
                  );

                  print(pedido.toJson());

                  
                  await pedidoProvider2
                      .registrarPedido(
                        pedido,
                  );

                             // Recargar mesas
                  await ref.read(mesasStateNotifierProvider.notifier).ConsultarMesas();

                  Navigator.pushAndRemoveUntil(

  context,

  MaterialPageRoute(
    builder: (_) => const MesasScreen(),
  ),

  (route) => false,
);
                  

                },

                child: const Text(
                  'Confirmar Pedido',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}