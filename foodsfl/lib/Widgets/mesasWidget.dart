import 'package:flutter/material.dart';

class Mesaswidget extends StatelessWidget {
  final String mesa;
  final bool estado;
    final VoidCallback onTap;

  const Mesaswidget( {
    super.key,
    required this.mesa,
    required this.estado,
   required this.onTap,
  });





  Color get color {
    switch (estado) {
      case true:
        return Colors.green;
      case false:
        return Colors.red;
      
    }
  }

  IconData get icon {
    switch (estado) {
      case true:
        return Icons.event_seat;
      case false:
        return Icons.restaurant;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap:onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color.withValues(alpha:   0.15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: color,
              ),
              const SizedBox(height: 10),
              Text(
                mesa,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Chip(
                label: Text(estado ? 'Disponible' : 'Ocupada',),
                backgroundColor: color,
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}