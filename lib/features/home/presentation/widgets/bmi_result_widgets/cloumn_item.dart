import 'package:flutter/material.dart';

class ColumnItem extends StatelessWidget {
  const ColumnItem({
    super.key,
    required this.value, required this.text,
  });

  final int value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            '$value',
            style: const TextStyle(color: Colors.purple, fontSize: 20,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.grey, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}