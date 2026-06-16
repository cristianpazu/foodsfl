import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/WEB/notifiers/produto_notifiers/producto_notifiers.dart';
import 'package:foodsfl/WEB/notifiers/submenu_notifiers/submenu_notifiers.dart';
import 'package:foodsfl/Widgets/cardProductos.dart';

class Productopage extends ConsumerStatefulWidget {
  const Productopage({super.key});

  @override
  _ProductopageState createState() => _ProductopageState();
}

class _ProductopageState extends ConsumerState {
  int? subMenuSeleccionado;
  String textoBusqueda = '';
  @override
  Widget build(BuildContext context) {
    final productos = ref.watch(productoStateNotifierProvider);

    final submenu = ref.watch(subMenuStateNotifierProvider);
/*
    final productosFiltrados = productos.producto?.where((producto) {
          if (subMenuSeleccionado == null) {
            return true;
          }

          return producto.idSubmenu == subMenuSeleccionado;
        }).toList() ??
        []; */

    final productosFiltrados = productos.producto?.where((producto) {
          final coincideSubmenu = subMenuSeleccionado == null ||
              producto.idSubmenu == subMenuSeleccionado;

          final coincideTexto = producto.nombre
              .toLowerCase()
              .contains(textoBusqueda.toLowerCase());

          return coincideSubmenu && coincideTexto;
        }).toList() ??
        [];

    return Column(
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
              hintText: 'Buscar producto...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: [
            ChoiceChip(
              label: const Text('Todos'),
              selected: subMenuSeleccionado == null,
              backgroundColor: Color.fromRGBO(254, 254, 254, 1),
              selectedColor: Color.fromRGBO(219, 122, 34, 1),
              onSelected: (_) {
                setState(() {
                  subMenuSeleccionado = null;
                });
              },
            ),
            ...?submenu.submenu?.map((sub) {
              return ChoiceChip(
                label: Text(sub.nombre),
                backgroundColor: Color.fromRGBO(254, 254, 254, 1), //219,122,34
                selectedColor: Color.fromRGBO(219, 122, 34, 1),

                selected: subMenuSeleccionado == sub.idSubmen,

                onSelected: (_) {
                  setState(() {
                    subMenuSeleccionado = sub.idSubmen;
                  });
                },
              );
            }),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // número de columnas
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: productosFiltrados.length,
              itemBuilder: (context, index) {
                /*
                  final producto = productos.producto![index];
                  print(producto.idSubmenu); */

                final producto = productosFiltrados[index];

                print('Productos: ${productos.producto?.length}');
                print('Submenus: ${submenu.submenu?.length}');

                return Column(
                  children: [
                    Cardproductos(
                      idProducto: producto.id!,
                      nombre: producto.nombre,
                      descripcion: producto.descripcion,
                      precio: producto.precio,
                      activo: producto.activo,
                    ),

                 
                  ],
                );
              }),
        ),

        
    Align(

      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Registrar producto
          },
          icon: const Icon(Icons.add),
          label: const Text('Producto'),
        ),
      ),
    ),
      ],
    );
  }
}
