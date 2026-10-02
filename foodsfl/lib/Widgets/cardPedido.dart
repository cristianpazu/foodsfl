import 'package:flutter/material.dart';
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart'
    show Historialpedidodto;

class CardPedidos extends StatelessWidget {
  int idProducto;
  String? nombreMesa;
  String? nombreProducto;
  List<Historialpedidodto>? productos;
  int? cantidad;

  CardPedidos(
      {super.key,
      required this.idProducto,
      this.nombreMesa,
      this.nombreProducto,
      this.cantidad,
      this.productos});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(253, 255, 253, 0.938), //Color.fromRGBO(122, 321, 12, 0.1),
      margin: EdgeInsets.zero,
      elevation: 10,
      child: Container(
        width: 200,
       
        padding: EdgeInsets.all(12),
        child: Column(
           mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pedido #$idProducto',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Mesa: ${nombreMesa}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Divider(),
              ...productos!.map(
                (producto) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: 
                  Row(
                          children: [
                            Text(
                              '${producto.nombreProducto} x ',
                            ),
                            Text(
                        '${producto.cantidad}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                          ],
                        ),
                  /*Text(
                    '${producto.cantidad} x ${producto.nombreProducto}',
                  ), */
                ),
              ),
          /*  ListView.builder(
              itemCount: productos!.length,
              itemBuilder: (context, index) {
                final producto = productos![index];
            
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              '${producto.nombreProducto} x ',
                            ),
                            Text(
                        '${producto.cantidad}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                          ],
                        ),
                      ),
                    
                    ],
                  ),
                );
              },
            ), */
            const Divider(),

            /*
           SizedBox(height: 5,),
            Text('${idProducto}'),
          Text('${nombreMesa}'),
            SizedBox(height: 5,),
            Text('${nombreProducto}'),
            SizedBox(height: 5,),
              Text('${cantidad}'),
               SizedBox(height: 20,), */
            Row(
              children: [
                /* Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                    color: color,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Center(child: Text(activo! ? 'Activo' : 'Inactivo',)),
                  ),
                   
                   SizedBox(width: 20,),
                    Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                    color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ) */
              ],
            )
          ],
        ),
      ),
    );
  }
}


