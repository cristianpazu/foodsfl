import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/WEB/notifiers/pedidos_notifiers/pedido_notifiers.dart'
    show pedidotateNotifierProvider;
import 'package:foodsfl/WEB/notifiers/produto_notifiers/producto_notifiers.dart';
import 'package:foodsfl/WEB/notifiers/submenu_notifiers/submenu_notifiers.dart';
import 'package:foodsfl/WEB/screen/Forms/ProductoFormModal.dart';
import 'package:foodsfl/WEB/widget/sistema.dart';
import 'package:foodsfl/Widgets/cardPedido.dart';
import 'package:foodsfl/Widgets/cardProductos.dart';

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
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // número de columnas
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: pedido.historialpedidodto?.length ?? 0,
                itemBuilder: (context, index) {
                  /*
                    final producto = productos.producto![index];
                    print(producto.idSubmenu); */

                  final pedidos = pedido.historialpedidodto![index];

                  print(pedido.historialpedidodto?.length);

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
                        idProducto: pedidos.idPedido,
                        nombreMesa: pedidos.nombreMesa,
                        nombreProducto: pedidos.nombreProducto,
                        cantidad: pedidos.cantidad,
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
