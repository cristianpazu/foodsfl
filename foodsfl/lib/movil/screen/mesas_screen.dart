import 'package:flutter/material.dart';

class MesasScreen extends StatelessWidget {
  const MesasScreen({super.key});

  @override
  Widget build(BuildContext context) {

 final allG = ['asd', 'asd','asd','qwe'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Mesas'),
      ),
      body:GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // número de columnas
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),  
  itemCount: allG.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('object');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blue,
              ),
                  child: Center(
                    child: Text('Item ${allG[index]}'),
                  ),
            ),
          );
        },)
    );
  }
}