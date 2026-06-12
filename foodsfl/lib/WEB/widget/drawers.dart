
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {

 

   DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          SizedBox(height: 10,),
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.amber, // color de fondo
            child: ClipOval(child: Image.asset('assets/salchiking.png'))/*Text(
              'f', // iniciales
              style: GoogleFonts.leckerliOne(
                  fontSize: 50, color: Color.fromRGBO(109, 109, 109, 1)),
            ), */
          ),
          SizedBox(height: 10,),
        

      Spacer(),

          // Aquí agregamos el texto al final
      
        ],
      ),
    );
  }
}