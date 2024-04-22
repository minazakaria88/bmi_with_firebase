import 'package:flutter/material.dart';

class NewTextFormFiled extends StatelessWidget {
  const NewTextFormFiled({super.key, required this.controller, required this.obscure, required this.label, required this.iconData});
  final TextEditingController controller;
  final bool obscure;
  final String label;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value)
        {
          if(value!.isEmpty) {
            return 'required';
          }
          return null;
        },
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            iconData,
            color: Colors.black,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
