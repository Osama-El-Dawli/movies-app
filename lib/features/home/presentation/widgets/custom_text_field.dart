import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Search for movies',
        prefixIcon: Icon(Icons.search),
      ),
      style: TextStyle(fontSize: 16),
    );
  }
}
