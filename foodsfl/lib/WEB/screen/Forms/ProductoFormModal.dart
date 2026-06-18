import 'package:flutter/material.dart';
import 'package:foodsfl/WEB/widget/campo_texto.dart';

class ProductoFormModal extends StatefulWidget {
  const ProductoFormModal({super.key});

  @override
  State<ProductoFormModal> createState() => _ProductoFormModalState();
}

class _ProductoFormModalState extends State<ProductoFormModal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: [
              const SizedBox(height: 16),
           
           campoTextoForm(
labelText: 'Nombre',
           ),
           const SizedBox(height: 16),
           campoTextoForm(
labelText: 'Descripcion',
           ),
const SizedBox(height: 16),
           campoTextoForm(
labelText: 'Precio',
keyboardType: TextInputType.number,
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
        )),
    );
  }
}