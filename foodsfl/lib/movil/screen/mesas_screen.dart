import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/notifiers/mesas_notifiers/mesas_notifiers.dart';

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

    print('object listaMesas ${listaMesas.mesas?.length} ');

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
            return GestureDetector(
              onTap: () {
                print('object');
                setState(() {
                  //  estados[index] = !estados[index];
                });
                print('object $cambiarColor');
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: listaMesas.mesas?[index].disponibilidad == true
                        ? color2
                        : color),
                child: Center(
                  child:
                      Text('Item ${listaMesas.mesas?[index].nombre} '),
                ),
              ),
            );
          },
        ));
  }
}
