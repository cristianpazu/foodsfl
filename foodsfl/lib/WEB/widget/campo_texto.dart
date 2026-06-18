import 'package:flutter/material.dart';

class campoTextoForm extends StatelessWidget {


  final String? hint;
  final TextInputType? keyboardType;
  final String? labelText;


  const campoTextoForm({
    super.key,
    this.hint,
    this.keyboardType,
    this.labelText
    
    
    });

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
              decoration:  InputDecoration(
                labelText: labelText,
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              ),
            );
  }
}