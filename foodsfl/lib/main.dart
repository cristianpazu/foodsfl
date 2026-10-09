import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodsfl/WEB/screen/PedidosPage.dart' show Pedidospage;
import 'package:foodsfl/WEB/screen/menuPrincipal.dart';
import 'package:foodsfl/WEB/screen/productoPage.dart';
import 'package:foodsfl/movil/screen/mesas_screen.dart';
import 'package:foodsfl/movil/screen/pedido_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveBreakpoints.builder(
            child: widget!,
            breakpoints: const [
              Breakpoint(start: 0, end: 450, name: MOBILE),
              Breakpoint(start: 451, end: 800, name: TABLET),
              Breakpoint(start: 801, end: 1920, name: DESKTOP),
              Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          home:    /* Menuprincipal()*/ AppInicio()//Pedidospage()//Menuprincipal()//
        //  MesasScreen(),//RestaurantePage()  //PedidoPage() ,
      ),
    );
  }
}


class AppInicio extends StatelessWidget {
  const AppInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    if (responsive.isMobile || responsive.isTablet) {
      return const MesasScreen();
    }

    return const Menuprincipal();
  }
}


class MovableCircle extends StatefulWidget {
  @override
  _MovableCircleState createState() => _MovableCircleState();
}

class _MovableCircleState extends State<MovableCircle> {
  double x = 100;
  double y = 100;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: x,
          top: y,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                x += details.delta.dx;
                y += details.delta.dy;
              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



class MenuItem {
  final int id;
  String nombre;
  bool activo;
  int cantidadSubmenus;

  MenuItem({
    required this.id,
    required this.nombre,
    required this.activo,
    this.cantidadSubmenus = 0,
  });
}

class MenuGestionScreen extends StatefulWidget {
  const MenuGestionScreen({super.key});

  @override
  State<MenuGestionScreen> createState() => _MenuGestionScreenState();
}

class _MenuGestionScreenState extends State<MenuGestionScreen> {
  final TextEditingController buscarController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();

  String filtro = 'Todos';
  String busqueda = '';
  bool activo = true;
  int? idEditando;

  final List<MenuItem> menus = [
    MenuItem(
      id: 1,
      nombre: 'Comidas',
      activo: true,
      cantidadSubmenus: 5,
    ),
    MenuItem(
      id: 2,
      nombre: 'Bebidas',
      activo: true,
      cantidadSubmenus: 3,
    ),
    MenuItem(
      id: 3,
      nombre: 'Alitas',
      activo: true,
      cantidadSubmenus: 4,
    ),
    MenuItem(
      id: 4,
      nombre: 'Menú de fin de semana',
      activo: false,
      cantidadSubmenus: 2,
    ),
    MenuItem(
      id: 5,
      nombre: 'Postres',
      activo: true,
      cantidadSubmenus: 3,
    ),
  ];

  List<MenuItem> get menusFiltrados {
    return menus.where((menu) {
      final coincideNombre = menu.nombre
          .toLowerCase()
          .contains(busqueda.toLowerCase());

      final coincideEstado = filtro == 'Todos' ||
          (filtro == 'Activos' && menu.activo) ||
          (filtro == 'Inactivos' && !menu.activo);

      return coincideNombre && coincideEstado;
    }).toList();
  }

  @override
  void dispose() {
    buscarController.dispose();
    nombreController.dispose();
    super.dispose();
  }

  void abrirFormulario({MenuItem? menu}) {
    idEditando = menu?.id;
    nombreController.text = menu?.nombre ?? '';
    activo = menu?.activo ?? true;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, actualizarDialogo) {
            return AlertDialog(
              title: Text(
                menu == null ? 'Registrar menú' : 'Actualizar menú',
              ),
              content: SizedBox(
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nombreController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Nombre del menú',
                        hintText: 'Ej. Comidas',
                        prefixIcon: const Icon(Icons.restaurant_menu),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Menú activo'),
                      value: activo,
                      onChanged: (valor) {
                        actualizarDialogo(() => activo = valor);
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancelar'),
                ),
                FilledButton.icon(
                  onPressed: () {
                    final nombre = nombreController.text.trim();

                    if (nombre.isEmpty) {
                      ScaffoldMessenger.of(this.context).showSnackBar(
                        const SnackBar(
                          content: Text('Ingresa el nombre del menú'),
                        ),
                      );
                      return;
                    }

                    setState(() {
                      if (menu == null) {
                        final nuevoId = menus.isEmpty
                            ? 1
                            : menus
                                    .map((m) => m.id)
                                    .reduce((a, b) => a > b ? a : b) +
                                1;

                        menus.add(
                          MenuItem(
                            id: nuevoId,
                            nombre: nombre,
                            activo: activo,
                          ),
                        );
                      } else {
                        menu.nombre = nombre;
                        menu.activo = activo;
                      }
                    });

                    Navigator.pop(dialogContext);
                  },
                  icon: Icon(menu == null ? Icons.add : Icons.save),
                  label: Text(menu == null ? 'Registrar' : 'Actualizar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
          child: Column(
            children: [
              // Buscador
              TextField(
                controller: buscarController,
                onChanged: (valor) {
                  setState(() => busqueda = valor);
                },
                decoration: InputDecoration(
                  hintText: 'Buscar menú...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFD4C9D8)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Filtros
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 8,
                children: ['Todos', 'Activos', 'Inactivos'].map((opcion) {
                  final seleccionado = filtro == opcion;

                  return ChoiceChip(
                    label: Text(opcion),
                    selected: seleccionado,
                    showCheckmark: seleccionado,
                    selectedColor: const Color(0xFFED762A),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: seleccionado ? Colors.white : Colors.black87,
                    ),
                    onSelected: (_) {
                      setState(() => filtro = opcion);
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Cuadrícula de menús
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int columnas = 2;

                    if (constraints.maxWidth >= 1400) {
                      columnas = 6;
                    } else if (constraints.maxWidth >= 1100) {
                      columnas = 5;
                    } else if (constraints.maxWidth >= 800) {
                      columnas = 4;
                    } else if (constraints.maxWidth >= 550) {
                      columnas = 3;
                    }

                    final lista = menusFiltrados;

                    if (lista.isEmpty) {
                      return const Center(
                        child: Text('No se encontraron menús'),
                      );
                    }

                    return GridView.builder(
                      itemCount: lista.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columnas,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) {
                        final menu = lista[index];

                        return Card(
                          color: Colors.white,
                          elevation: 4,
                          shadowColor: Colors.black26,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: InkWell(
                            onTap: () => abrirFormulario(menu: menu),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.restaurant_menu,
                                        size: 30,
                                        color: Color(0xFFED762A),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        tooltip: 'Actualizar menú',
                                        onPressed: () =>
                                            abrirFormulario(menu: menu),
                                        icon: const Icon(
                                          Icons.edit_outlined,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    menu.nombre,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${menu.cantidadSubmenus} submenús',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: menu.activo
                                              ? Colors.green
                                              : Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        menu.activo ? 'Activo' : 'Inactivo',
                                        style: TextStyle(
                                          color: menu.activo
                                              ? Colors.green.shade700
                                              : Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => abrirFormulario(),
        backgroundColor: const Color(0xFFE9DCFF),
        foregroundColor: const Color(0xFF60429B),
        icon: const Icon(Icons.add),
        label: const Text('Menú'),
      ),
    );
  }
}
