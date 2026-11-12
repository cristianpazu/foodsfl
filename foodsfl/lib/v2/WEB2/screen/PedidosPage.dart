import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'
    show MasonryGridView;
import 'package:foodsfl/v2/WEB2/DTO/PedidoResponseDTO.dart'
    show PedidoResponseDTO;
import 'package:foodsfl/v2/WEB2/DTO/PedidosResponseDTO.dart';
import 'package:foodsfl/v2/WEB2/Widgets/cardPedido.dart' show CardPedidos;
import 'package:foodsfl/v2/WEB2/notifiers/pedidos_notifiers/pedido_notifiers.dart'
    show pedidotateNotifierProvider;
import 'package:foodsfl/v2/WEB2/widget/sistema.dart';

class Pedidospage extends ConsumerStatefulWidget {
  const Pedidospage({super.key});

  @override
  _PedidospagepageState createState() => _PedidospagepageState();
}

class _PedidospagepageState extends ConsumerState {
  int? subMenuSeleccionado;
  String textoBusqueda = '';
  @override
  Widget build(BuildContext context) {
    final pedido = ref.watch(pedidotateNotifierProvider);
    final sizeScreen = MediaQuery.of(context).size;
    print('>>>>>>>>>>>>>>>>>>>>< ${pedido.historialpedidodto?.length}');

    final pedidosUnicos = pedido.pedidosResponseDTO ?? [];

    /* final Map<int, List<PedidosResponseDTO>> pedidosAgrupados = {};

    for (final item in historial) {
      pedidosAgrupados.putIfAbsent(item.idPedido!, () => []);
print('>>>>>>>>>>>>>>>>>>>>< ${item}');
      pedidosAgrupados[item.idPedido]!.add(item);
    }

    final pedidosUnicos = pedidosAgrupados.values.toList(); */
    final ScrollController _horizontalController = ScrollController();
    @override
    void dispose() {
      _horizontalController.dispose();
      super.dispose();
    }

/*
    final productosFiltrados = productos.producto?.where((producto) {
          if (subMenuSeleccionado == null) {
            return true;
          }

          return producto.idSubmenu == subMenuSeleccionado;
        }).toList() ??
        []; */

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  textoBusqueda = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar pedidosssssssssss...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: /* SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
  child: SizedBox(
    width: double.infinity,
    child: Wrap(
     alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
  spacing: 20,       // espacio horizontal
  runSpacing: 20,    // espacio vertical
      children: List.generate(
        pedidosUnicos.length,
        (index) {
          final productosPedido = pedidosUnicos[index];
    
          final primerProducto = productosPedido.first;
    
          return SizedBox(
            width: 200,
            child: CardPedidos(
              idProducto: primerProducto.idPedido,
              nombreMesa: primerProducto.nombreMesa,
              productos: productosPedido,
            ),
          );
        },
      ),
    ),
  ),
) */

                Expanded(
              child: Builder(
                builder: (context) {
                  // Filtrar los pedidos por número o mesa.
                  final pedidosFiltrados = pedidosUnicos.where((pedido) {
                    final busqueda = textoBusqueda.toLowerCase();

                    return (pedido.idPedido?.toString() ?? '')
                            .toLowerCase()
                            .contains(busqueda) ||
                        (pedido.nombreCliente ?? '')
                            .toLowerCase()
                            .contains(busqueda) ||
                        (pedido.direccionEntrega ?? '')
                            .toLowerCase()
                            .contains(busqueda);
                  }).toList();

                  return LayoutBuilder(builder: (context, constraints) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        controller: _horizontalController,
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: DataTable(
                            headingRowColor: WidgetStateProperty.all(
                              const Color(0xFFF1F3F6),
                            ),
                            columns: const [
                              DataColumn(label: Text('# Pedido')),
                              DataColumn(label: Text('Cliente')),
                              DataColumn(label: Text('total')),
                              DataColumn(label: Text('Metodo de pago')),
                              DataColumn(label: Text('Estado')),
                              DataColumn(label: Text('Fecha y hora')),
                              DataColumn(label: Text('Acciones')),
                            ],
                            rows: pedidosFiltrados.map((primerProducto) {

final totalPedido = (primerProducto.items ?? []).fold<double>(
  0,
  (total, producto) {
    final cantidad = producto.cantidad ?? 0;
    final precio = producto.precioUnitario ?? 0;

    return total + (cantidad * precio);
  },
);


                              return DataRow(
                                cells: [
                                  // Número del pedido
                                  DataCell(
                                    Text('#${primerProducto.idPedido ?? ''}'),
                                  ),

                                  // Cliente
                                  DataCell(
                                    Text(primerProducto.nombreCliente ?? ''),
                                  ),

                                  // total del pedido
                                  DataCell(
                                    Text(
                                      '${primerProducto.totalCuenta}',
                                    ),
                                  ),
                                  // Productos del pedido
                                  DataCell(Text(
                                    '${primerProducto.metodoPago}',
                                  )),
                                  // Productos del pedido
                                  DataCell(Text(
                                    '${primerProducto.idPedido}',
                                  )),
                                  // Fecha y hora
                                  DataCell(
                                    Text(
                                      '${Sistema.formatoFecha(primerProducto.fecha!)} '
                                      '${Sistema.formatoHoraString(primerProducto.hora!)}',
                                    ),
                                  ),
                                  // Acciones
                                  DataCell(
                                    IconButton(
                                      icon: const Icon(
                                        Icons.visibility,
                                        color:
                                            Color.fromARGB(255, 149, 180, 211),
                                      ),
                                      onPressed: () {
                                        // Aquí puedes abrir el detalle del pedido.
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            backgroundColor: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            title: Text(
                                              'Pedido #${primerProducto.idPedido}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF1E293B),
                                              ),
                                            ),
                                            content: SizedBox(
                                              width: sizeScreen.width * 0.5,
                                              height: sizeScreen.height * 0.8,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                             border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey, // Color del borde
                                                                    width:
                                                                        1.5, // Grosor del borde
                                                                  ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      0.822)),
                                                          width:
                                                              sizeScreen.width *
                                                                  0.5,
                                                          height: 250,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Informacion del cliente',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .person,
                                                                      color: Color(
                                                                          0xFF263746),
                                                                      size: 24,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 25,
                                                                    ),
                                                                    Text(
                                                                      '${primerProducto.nombreCliente}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                        Icons
                                                                            .phone,
                                                                        size:
                                                                            28),
                                                                    SizedBox(
                                                                      width: 25,
                                                                    ),
                                                                    Text(
                                                                      '${primerProducto.telefonoCliente}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                        Icons
                                                                            .location_on_outlined,
                                                                        size:
                                                                            28),
                                                                    SizedBox(
                                                                      width: 25,
                                                                    ),
                                                                    Text(
                                                                      '${primerProducto.direccionEntrega}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey, // Color del borde
                                                                    width:
                                                                        1.5, // Grosor del borde
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          0.822)),
                                                          width:
                                                              sizeScreen.width *
                                                                  0.5,
                                                          height: 250,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Informacion Pedido',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(Icons
                                                                        .date_range_outlined),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            'Fecha y hora'),
                                                                        Text(
                                                                          '${Sistema.formatoFecha(primerProducto.fecha!)} - ${Sistema.formatoHoraString(primerProducto.hora!)}',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(Icons
                                                                        .phone),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            'Metodo de pago'),
                                                                        Text(
                                                                          '${primerProducto.metodoPago}',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(Icons
                                                                        .location_on_outlined),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            'Total'),
                                                                        Text(
                                                                          '${primerProducto.totalCuenta}',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    'Productos del pedido',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: LayoutBuilder(

                                                      builder: (context,
                                                          constraints) {
                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child:
                                                                ConstrainedBox(
                                                              constraints:
                                                                  BoxConstraints(
                                                                minWidth:
                                                                    constraints
                                                                        .maxWidth,
                                                              ),
                                                              child: DataTable(
                                                                  headingRowColor: WidgetStateProperty.all(
                              const Color(0xFFF1F3F6),
                            ),
                                                                columnSpacing:
                                                                    30,
                                                                horizontalMargin:
                                                                    16,
                                                                columns: const [
                                                                  DataColumn(
                                                                      label: Text(
                                                                          'Producto')),
                                                                  DataColumn(
                                                                      label: Text(
                                                                          'Cantidad')),
                                                                  DataColumn(
                                                                      label: Text(
                                                                          'Precio')),
                                                                  DataColumn(
                                                                      label: Text(
                                                                          'Subtotal')),
                                                                ],
                                                                rows: (primerProducto
                                                                            .items ??
                                                                        [])
                                                                    .map(
                                                                        (producto) {
                                                                  final cantidad =
                                                                      producto.cantidad ??
                                                                          0;
                                                                  final precio =
                                                                      producto.precioUnitario ??
                                                                          0;

                                                                  return DataRow(
                                                                    cells: [
                                                                      DataCell(Text(
                                                                          producto.nombre ??
                                                                              '')),
                                                                      DataCell(Text(
                                                                          '$cantidad')),
                                                                      DataCell(Text(
                                                                          '$precio')),
                                                                      DataCell(Text(
                                                                          '${cantidad * precio}')),
                                                                    ],
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                  /*  Expanded(
                                                    child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                    
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child:
                                                                      DataTable(
                                                                    columns: const [
                                                                      DataColumn(
                                                                          label:
                                                                              Text('Producto')),
                                                                      DataColumn(
                                                                          label:
                                                                              Text('Cantidad')),
                                                                      DataColumn(
                                                                          label:
                                                                              Text('Precio')),
                                                                      DataColumn(
                                                                          label:
                                                                              Text('Subtotal')),
                                                                    ],
                                                                  rows: (primerProducto.items ?? []).map((producto) {
                                                                    int subTotal =  (producto.cantidad!) * (producto.precio!);
                                                                      return DataRow(
                                                                        cells: [
                                                                          DataCell(Text(producto.nombre ??
                                                                              '')),
                                                                          DataCell(
                                                                              Text('${producto.cantidad ?? 0}')),
                                                                          DataCell(
                                                                              Text('${producto.precioUnitario ?? 0}')),
                                                                          DataCell(
                                                                              Text('${subTotal ?? 0}')),
                                                                        ],
                                                                      );
                                                                    }).toList(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ) */,
                                                 Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text('Total del pedido ${totalPedido}')
                                                  ],
                                                 )
                                                ],

                                                /*productosPedido
                                                    .map((producto) {
                                                  return Text(
                                                      '${producto.descripcion}');
                                                }).toList(), */
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),

            /*  MasonryGridView.count(
                    /* gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // número de columnas
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ), */

                    crossAxisCount: 6,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: const EdgeInsets.all(20),
                    itemCount: pedidosUnicos
                        .length, //pedido.historialpedidodto?.length ?? 0,
                    itemBuilder: (context, index) {
                      /*
                    final producto = productos.producto![index];
                    print(producto.idSubmenu); */

                      final pedidos = pedido.pedidoResponseDTO![index];

                      print(pedido.pedidoResponseDTO?.length);

                      final productosPedido = pedidosUnicos[index];

                      final primerProducto = productosPedido.first;

                      return /*Card(
  child: Column(
    children: [
      Text('Pedido: ${pedidos.idPedido}'),
      Text('Mesa: ${pedidos.nombreMesa}'),
      Text('Producto: ${pedidos.nombreProducto}'),
      Text('Cantidad: ${pedidos.cantidad}'),
    ],
  ),
); */
                          Column(
                        children: [
                          CardPedidos(
                              idProducto: primerProducto.idPedido!,
                              nombreMesa: primerProducto.descripcion,
                              productos: productosPedido

                              /*
                        nombreProducto: pedidos.nombreProducto,
                        cantidad: pedidos.cantidad, */
                              ),
                        ],
                      );
                    }
                    ),*/
          ),
        ],
      ),
    );
  }
}
