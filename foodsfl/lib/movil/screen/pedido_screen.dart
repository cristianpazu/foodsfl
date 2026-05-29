import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/movil/notifiers/submenu_notifier/submenu_notifiers.dart';
import 'package:foodsfl/movil/providers/submenu_providers.dart';

class PedidoPage extends ConsumerStatefulWidget {
  const PedidoPage({super.key});

  @override
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends ConsumerState<PedidoPage> {
  bool isChecked = false;
  final Map<int, bool> seleccionados = {};

  @override
  Widget build(BuildContext context) {
    final subMenuList = ref.watch(subMenuStateNotifierProvider);

    int calcularTotal() {
      int total = 0;

      final subMenus = ref.read(subMenuStateNotifierProvider);

      for (var subMenu in subMenus.submenu ?? []) {
        for (var producto in subMenu.productos ?? []) {
          final seleccionado = seleccionados[producto.idProductos] ?? false;

          if (seleccionado) {
            total += ((producto.precio ?? 0) as num).toInt();
          }
        }
      }

      return total;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu del dia'),
      ),
      body: ListView.builder(
        itemCount: subMenuList.submenu?.length,
        itemBuilder: (context, index) {
          final subMenu = subMenuList.submenu?[index];

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  subMenu?.nombre ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Escoja el menú que desea',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: subMenu?.productos?.length,
                itemBuilder: (context, index) {
                  final producto = subMenu?.productos?[index];

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      producto?.Nombre ?? '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      producto?.Descripcion ?? '',
                                      maxLines: 6,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      '\$${producto?.precio ?? 0}',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(
                                value: seleccionados[producto?.idProductos] ??
                                    false,
                                onChanged: (bool? value) {
                                  setState(() {
                                    seleccionados[producto!.idProductos!] =
                                        value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${calcularTotal()}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
