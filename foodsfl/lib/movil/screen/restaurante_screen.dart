import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/notifiers/carrito_notifiers/carritoState.dart';
import 'package:foodsfl/movil/notifiers/carrito_notifiers/carrito_state_notifiers.dart';
import 'package:foodsfl/movil/notifiers/restaurante_notifiers/restaurante_notifiers.dart';
import 'package:foodsfl/movil/notifiers/submenu_notifier/submenu_notifiers.dart';
import 'package:foodsfl/movil/screen/carrito_screen.dart';

class RestaurantePage extends ConsumerStatefulWidget {
  final int idMesas;

  const RestaurantePage({super.key, required this.idMesas});

  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends ConsumerState<RestaurantePage> {
  bool isChecked = false;
  final Map<int, bool> seleccionados = {};

  
/*
  int calcularTotal(restauranteState) {
    int total = 0;

    for (var menu in restauranteState.restauranteDTO.menus) {
      for (var subMenu in menu.submenu) {
        for (var producto in subMenu.productos) {
          final seleccionado = seleccionados[producto.id] ?? false;

          if (seleccionado) {
            total += ((producto.precio ?? 0) as num).toInt();
          }
        }
      }
    }

    return total;
  } */

  
  @override
  Widget build(BuildContext context) {
    final restauranteState = ref.watch(restaurantetateNotifierProvider);

final carritoState =
    ref.watch(carritoStateNotifier);


int calcularTotal(Carritostate carritoState) {
  return carritoState.items.fold(
    0,
    (total, item) => total + item.total,
  );
}


    if (restauranteState.isLoding!) {
      print('entreee aquuuiii');
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (restauranteState.restauranteDTO == null) {
      return const Scaffold(
        body: Center(
          child: Text('No hay información'),
        ),
      );
    }

    final menus = restauranteState.restauranteDTO?.menus;



    return Scaffold(
      appBar: AppBar(
        title: Text(
          restauranteState.restauranteDTO!.nombres,
        ),
      ),
      body: ListView.builder(
        itemCount: menus?.length,
        itemBuilder: (context, menuIndex) {
          final menu = menus?[menuIndex];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  menu!.nombreMenu,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menu.submenu.length,
                itemBuilder: (context, subIndex) {
                  final subMenu = menu.submenu[subIndex];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: Text(
                          subMenu.nombre,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: subMenu.productos.length,
                        itemBuilder: (context, productIndex) {
                          final producto = subMenu.productos[productIndex];


  final productos =
      subMenu.productos[productIndex];

  final existe = carritoState.items.any(
    (e) => e.idProducto == productos.id,
  );


                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          producto.nombre,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          producto.descripcion,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          '\$${producto.precio}',
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  
                                  Checkbox(
                                    value: existe,//seleccionados[producto.id] ?? false,
                                    onChanged: (value) {
                                     if (value == true) {

      ref
          .read(carritoStateNotifier.notifier)
          .agregarProducto(producto);

    } else {

      ref
          .read(carritoStateNotifier.notifier)
          .eliminarProducto(producto.id);

    }
                                     
                                     /* setState(() {
                                        seleccionados[producto.id] = value!;

                                        if (value == true) {
                                          ref
                                              .read(
                                                  carritoStateNotifier.notifier)
                                              .agregarProducto(producto);
                                        } else {
                                          ref
                                              .read(
                                                  carritoStateNotifier.notifier)
                                              .eliminarProducto(producto.id);
                                        }
                                      }); */
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${calcularTotal(carritoState)}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>  CarritoPage(
                      idMesa: widget.idMesas,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
              label: const Text(
                'Carrito',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
