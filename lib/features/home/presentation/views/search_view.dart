import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: const [CustomTextField()]),
      ),
    );
  }
}
