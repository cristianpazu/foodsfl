import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/Widgets/mesasWidget.dart';
import 'package:foodsfl/movil/notifiers/carrito_notifiers/carrito_state_notifiers.dart';
import 'package:foodsfl/movil/notifiers/mesas_notifiers/mesas_notifiers.dart';
import 'package:foodsfl/movil/screen/restaurante_screen.dart';

class MesasScreen extends ConsumerStatefulWidget {
  const MesasScreen({super.key});

  @override
  _MesasScreenState createState() => _MesasScreenState();
}

class _MesasScreenState extends ConsumerState {
  bool cambiarColor = true;
  //List<bool> estados =[] ;

  @override
  Widget build(BuildContext context) {
    final listaMesas = ref.watch(mesasStateNotifierProvider);

    Color color = Colors.green;
    Color color2 = Colors.blue;

    return Scaffold(
        appBar: AppBar(
          title: Text('Mesas'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // número de columnas
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: listaMesas.mesas?.length ?? 0,
          itemBuilder: (context, index) {
            final mesa = listaMesas.mesas![index];
            final disponible = mesa.disponibilidad == true;
            print('dis $disponible');
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Mesaswidget(
               mesa:listaMesas.mesas![index].nombre ?? '',
               estado:  listaMesas.mesas![index].disponibilidad ?? true,
               onTap:
                () {
             if (!disponible) return;
                    ref
                  .read(carritoStateNotifier.notifier)
                  .limpiarCarrito(); 
                     print('Tap detectado');
            
                    
                      //  estados[index] = !estados[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantePage(
                            idMesas: mesa.idMesas!,
                          ),
                        ),
                      );
                    
                   
                  }
               
              )
              
              
              /*Container(
                 width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white, // Color del contenedor
                  border: Border.all(
                    color: Colors.blue, // Color del borde
                    width: 3, // Grosor del borde
                  ),
                  borderRadius: BorderRadius.circular(10), 
                  // Bordes redondeados
                ),
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                       width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: listaMesas.mesas?[index].disponibilidad == true
                      ? color2
                      : color, // Color del contenedor
                  border: Border.all(
                    color: Colors.blue, // Color del borde
                    width: 3, // Grosor del borde
                  ),
                  borderRadius: BorderRadius.circular(10), 
                  // Bordes redondeados
                ),
                child: Center(
                child: disponible
                    ? Text('Mesas ${listaMesas.mesas?[index].idMesas} ')
                    : Text('Mesas # ${listaMesas.mesas?[index].idMesas} no dispnible '),
              ),
            
                    ),
                  ),
              ), */
            );
          },
        ));
  }
}
