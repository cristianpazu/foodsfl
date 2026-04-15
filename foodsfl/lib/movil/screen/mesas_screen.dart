import 'package:flutter/material.dart';

class MesasScreen extends StatefulWidget {
  const MesasScreen({super.key});

  @override
  State<MesasScreen> createState() => _MesasScreenState();
}

class _MesasScreenState extends State<MesasScreen> {
  bool cambiarColor = true;
  List<bool> estados =[] ;
  @override
  Widget build(BuildContext context) {

 final allG = ['asd', 'asd','asd','qwe'];

 Color color = Colors.green;
  Color color2 = Colors.blue;

 

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
              setState(() {
                estados[index] = !estados[index];
              });
                     print('object $cambiarColor');
            },
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              color: estados[index] ? color2 : color
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