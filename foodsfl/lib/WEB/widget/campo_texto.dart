import 'package:flutter/material.dart';

class campoTextoForm extends StatelessWidget {


  final String? hint;
  final TextInputType? keyboardType;
  final String? labelText;
    final TextEditingController? controller;


  const campoTextoForm({
    super.key,
    this.hint,
    this.keyboardType,
    this.labelText,
     this.controller,
    
    
    });

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      controller: controller,
              decoration:  InputDecoration(
                labelText: labelText,
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              ),
            );
  }
}