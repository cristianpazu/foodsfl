import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/WEB/notifiers/produto_notifiers/producto_notifiers.dart';
import 'package:foodsfl/Widgets/cardProductos.dart';

class Productopage extends ConsumerStatefulWidget {
  const Productopage({super.key});

  @override
  _ProductopageState createState() => _ProductopageState();

}

class _ProductopageState extends ConsumerState {
  @override
  Widget build(BuildContext context) {


  final productos = ref.watch(productoStateNotifierProvider);

    return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6, // número de columnas
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productos.producto?.length ?? 0,
          itemBuilder: (context, index) {
            final producto = productos.producto![index];
            print(producto.idSubmenu);
       
            return Column(
              children: [
               
            
            
                Cardproductos(idProducto: producto.id!, nombre: producto.nombre, descripcion: producto.descripcion, precio: producto.precio,activo: producto.activo,),
              ],
            );
          
  });
}}