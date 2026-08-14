import 'package:flutter/material.dart';

class CardPedidos extends StatelessWidget {
  int idProducto;
  String? nombreMesa;
  String? nombreProducto;
  int? cantidad;



   CardPedidos({super.key, required this.idProducto, this.nombreMesa, this.nombreProducto, this.cantidad});



  @override
  Widget build(BuildContext context) {
    return Card( 
      color: Color.fromRGBO(122, 321, 12, 0.1),
  margin: EdgeInsets.zero,
elevation: 10,
    child: Container(
      width: 200,
      height: 200,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(height: 5,),
          Text('${nombreMesa}'),
            SizedBox(height: 5,),
            Text('${nombreProducto}'),
            SizedBox(height: 5,),
              Text('${cantidad}'),
               SizedBox(height: 20,),
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