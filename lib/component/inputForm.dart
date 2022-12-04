import 'package:flutter/material.dart';

class InputFormComponet extends StatelessWidget {
  final String placeholder;
  final String labelText;
  TextEditingController controller;

  InputFormComponet(
      {super.key,
      required this.placeholder,
      required this.labelText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: placeholder,
        labelText: labelText,
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatorio';
        }
        return null;
      },
    );
  }
}
