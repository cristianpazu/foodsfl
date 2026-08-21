import 'package:flutter/material.dart';
import 'package:foodsfl/WEB/screen/PedidosPage.dart' show Pedidospage;
import 'package:foodsfl/WEB/screen/productoPage.dart';
import 'package:foodsfl/WEB/widget/drawers.dart';
import 'package:foodsfl/Widgets/cardProductos.dart';
import 'package:foodsfl/movil/screen/mesas_screen.dart';

class Menuprincipal extends StatefulWidget {
  const Menuprincipal({super.key});

  @override
  State<Menuprincipal> createState() => _MenuprincipalState();
}

class _MenuprincipalState extends State<Menuprincipal> {
  int selectedIndex = 0;

  final pages = [
    Productopage(),
    Pedidospage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('sda'),
        ),
        body: Row(
          children: [
            Sidebar(
              selectedIndex: selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            Expanded(
              child: Column(
                children: [ /*
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar producto...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ), */
                  Expanded(
                    child: pages[selectedIndex],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      width: 250,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            '🍔 Foods',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Productos'),
            selected: selectedIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            leading: const Icon(Icons.outdoor_grill_outlined),
            title: const Text('Pedidos'),
            selected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
          ),

          /*ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Mesas'),
            selected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
          ),

          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text('Pedidos'),
            selected: selectedIndex == 2,
            onTap: () => onItemSelected(2),
          ),

          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text('Productos'),
            selected: selectedIndex == 3,
            onTap: () => onItemSelected(3),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            selected: selectedIndex == 4,
            onTap: () => onItemSelected(4),
          ), */
        ],
      ),
    );
  }
}
