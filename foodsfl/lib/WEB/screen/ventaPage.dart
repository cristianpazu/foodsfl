
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show AlertDialog, BorderRadius, BuildContext, Card, Colors, Column, Container, EdgeInsets, ElevatedButton, Expanded, Icon, Icons, InputDecoration, Navigator, OutlineInputBorder, Scaffold, SizedBox, Text, TextButton, TextField, Widget, showDialog;
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerStatefulWidget, ConsumerState;
import 'package:foodsfl/WEB/notifiers/venta_notifiers/venta_notifiers.dart';

class Ventapage extends ConsumerStatefulWidget {
  const Ventapage({super.key});

  @override
  _VentapagepageState createState() => _VentapagepageState();
}

class _VentapagepageState extends ConsumerState {
 
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      ref
          .read(ventatateNotifierProvider.notifier)
          .consultarVentaHoy();
    });
  }


  @override
  Widget build(BuildContext context) {
    
    final venta = ref.watch(ventatateNotifierProvider);


    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text('Ventas de hoy')),
            const SizedBox(height: 20),
        ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(
                  children: [
                  
                   
                    _indicadorVenta(
                      titulo: 'Ventas realizadas',
                      valor: venta.estadoVenta?.totalVendido ?? 0,
                    ),
                    const SizedBox(width: 16),
        
                    _indicadorVenta(
                      titulo: 'Pedidos',
                      valor: venta.estadoVenta?.pedidosHoy ?? 0,
                    ),
                    const SizedBox(width: 16),
        
                    _indicadorVenta(
                      titulo: 'Productos vendidos',
                      valor: venta.estadoVenta?.productosVendidos ?? 0,
                    ), 
                  ],
                ),
              ),
            /*         Padding(
              padding: const EdgeInsets.only(left: 512, right: 512),
              child: Container(
                color: Color.fromRGBO(255, 175, 179, 1),
                child: Row(
                  children: [
                
                    Container(
                      child: Column(
                        children: [
                          Text('Ventas realizadas'),
                          Text('data'),
                        ],
                      ),
                    ),
                    //
                    SizedBox(width: 120),
                     Container(
                      child: Column(
                        children: [
                          Text('Pedidos'),
                          Text('data'),
                        ],
                      ),
                                       ),
                    //
                      SizedBox(width: 120),
                    Container(
                      child: Column(
                        children: [
                          Text('Productos vendidos'),
                          Text('data'),
                        ],
                      ),
                    ) 
                
                  ],
                ),
              ),
            ), */
           
            
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }

}
Widget _indicadorVenta({
  required String titulo,
  required int valor,
}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 175, 179, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 12),
          Text(
            '$valor',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}