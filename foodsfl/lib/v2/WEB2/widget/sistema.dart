import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class Sistema {

Widget alertDialogEnviarPedido2(
  BuildContext context,
    List<dynamic> submenus,
  void Function(String nombre, String direccion, String metodoPago) accion,
) {
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController direccionCtrl = TextEditingController();
  int? idSubmenuSeleccionado;

  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: const Text(
      'Completa tus datos',
       style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 20,
   
                                          ),//style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nombreCtrl,
            decoration: InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: direccionCtrl,
            decoration: InputDecoration(
              labelText: 'Descripcion',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

           TextField(
            controller: direccionCtrl,
            decoration: InputDecoration(
              labelText: 'Descripcion',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 10),

          DropdownButtonFormField<int>(
            value: idSubmenuSeleccionado,
            decoration: InputDecoration(
              labelText: 'Escoge un submenu',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            items: submenus.map((sub) {

    return DropdownMenuItem<int>(
      value: sub.idSubmen,
      child: Text(sub.nombre),
    );

  }).toList(),
  onChanged: (value) {
    idSubmenuSeleccionado = value;
  },
),
        ],
      ),
    ),
    actions: [
      
    ],
  );
}

static String formatoFecha(DateTime fecha) {
    String date = '${fecha.day}/${fecha.month}/${fecha.year}';
    DateTime parseDate = DateFormat("dd/MM/yyyy").parse(date);

    DateFormat dateFormat = DateFormat("yyyy-MM-dd");

    return dateFormat.format(parseDate);
  }

  static String formatoHora(DateTime fecha) {
    return DateFormat('HH:mm:ss').format(fecha);
  }

   static DateTime formatoStringFecha(String? fecha) {
    final fechaFormateada = DateTime.parse(fecha ?? '${DateTime.now()}');
    return DateTime(
      fechaFormateada.year,
      fechaFormateada.month,
      fechaFormateada.day,
    );
  }

  static DateTime fechaActual() {
    return DateTime.now();
  }

}
