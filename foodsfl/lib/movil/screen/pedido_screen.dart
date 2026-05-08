import 'package:flutter/material.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({super.key});

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu del dia'),
      ),
      body: Column(
        children: [
          Text('escoja el menu que desea'),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Arroz con pollo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Arroz con cebolla y pollo'),
                  Text('40.000'),
                ],
              ),
              Spacer(),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Arroz con pollo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Arroz con cebolla y pollo'),
                  Text('40.000'),
                ],
              ),
              Spacer(),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Arroz con pollo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Arroz con cebolla y pollo'),
                  Text('40.000'),
                ],
              ),
              Spacer(),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Arroz con pollo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Arroz con cebolla y pollo'),
                  Text('40.000'),
                ],
              ),
              Spacer(),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Arroz con pollo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Arroz con cebolla y pollo'),
                  Text('40.000'),
                ],
              ),
              Spacer(),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Arroz con pollo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Arroz con cebolla y pollo'),
                  Text('40.000'),
                ],
              ),
              Spacer(),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Arroz con pollo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Arroz con cebolla y pollo'),
                  Text('40.000'),
                ],
              ),
              Spacer(),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
