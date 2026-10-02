import 'package:flutter/material.dart';
import 'package:foodsfl/WEB/DTO/HistorialPedidoDTO.dart'
    show Historialpedidodto;

class CardPedidos2 extends StatelessWidget {
  int idProducto;
  String? nombreMesa;
  String? nombreProducto;
  List<Historialpedidodto>? productos;
  int? cantidad;
  int? totalCuenta;

  CardPedidos2(
      {super.key,
      required this.idProducto,
      this.nombreMesa,
      this.nombreProducto,
      this.cantidad,
      this.productos,this.totalCuenta});

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
            const Divider(),

 Text(
              'Total: \$${totalCuenta}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
            Row(
  children: [
    Expanded(
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.check_circle,
          size: 18,
        ),
        label: const Text(
          'Pagado',
          overflow: TextOverflow.ellipsis,
        ),
        style: TextButton.styleFrom(
          foregroundColor: Colors.green,
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 40),
        ),
      ),
    ),

    Expanded(
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.cancel,
          size: 18,
        ),
        label: const Text(
          'Cancelado',
          overflow: TextOverflow.ellipsis,
        ),
        style: TextButton.styleFrom(
          foregroundColor: Colors.red,
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 40),
        ),
      ),
    ),
  ],
)

          ],
        ),
      ),
    );
  }
}





