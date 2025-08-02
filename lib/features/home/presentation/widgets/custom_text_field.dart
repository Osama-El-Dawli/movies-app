import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for movies',
        border: buildBorder(),
        focusedBorder: buildBorder(Color(0xffFFCC00)),
        enabledBorder: buildBorder(),
        suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ),
      style: TextStyle(fontSize: 16),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: color ?? Colors.black),
    );
  }
}
