import 'package:flutter/material.dart';
import 'package:foodsfl/WEB/widget/campo_texto.dart';

class ProductoFormModal extends StatefulWidget {

  final  List<dynamic>? submenus;

   ProductoFormModal( this.submenus);

  @override
  State<ProductoFormModal> createState() => _ProductoFormModalState();
}

class _ProductoFormModalState extends State<ProductoFormModal> {

  final TextEditingController nombreController =
      TextEditingController();

  final TextEditingController descripcionController =
      TextEditingController();

  final TextEditingController precioController =
      TextEditingController();

  int? idSubmenuSeleccionado;



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
              title: const Text('Nuevo Producto'),

      content: SizedBox(
        width: 500,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                    const SizedBox(height: 16),
                 
                 campoTextoForm(
                      labelText: 'Nombre',
                      controller: nombreController,
                 ),
                 const SizedBox(height: 16),
                 campoTextoForm(
                      labelText: 'Descripcion',
                      controller: descripcionController,
                 ),
                      const SizedBox(height: 16),
                 campoTextoForm(
                      labelText: 'Precio',
                      controller: precioController,
                      keyboardType: TextInputType.number,
                 ),
                     const SizedBox(height: 16),
                 DropdownButtonFormField<int>(
                  value: idSubmenuSeleccionado,
                  decoration: InputDecoration(
                    labelText: 'Escoge un submenu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                   items: widget.submenus!.map((sub) {
                        return DropdownMenuItem<int>(
                          value: sub.idSubmen,
                          child: Text(sub.nombre),
                        );
                      }).toList(),
                        onChanged: (value) {
                      idSubmenuSeleccionado = value;
                        },
                      ),
                      
                 
                 /*  TextFormField(
                    decoration:  InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    ),
                  ), */
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Guardar'),
                  ),
                ],
              ),
            )),
        ),
      ),
    );
  }
}