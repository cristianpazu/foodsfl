import 'package:flutter/material.dart';

class Cardproductos extends StatelessWidget {
  int idProducto;
  String? nombre;
  String? descripcion;
  int? precio;
  bool? activo;


   Cardproductos({super.key, required this.idProducto, this.nombre, this.descripcion, this.precio, this.activo});


   Color get color {
    switch (activo!) {
      case true:
        return Colors.blue;
      case false:
        return Colors.red;
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
          Text('${nombre}'),
            SizedBox(height: 5,),
            Text('${descripcion}'),
            SizedBox(height: 5,),
              Text('${precio}'),
               SizedBox(height: 20,),
              Row(
                children: [
                  Container(
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
                  )
                ],
              )
        ],
      ),
    ),
    );
  }
}