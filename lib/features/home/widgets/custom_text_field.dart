import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/cubits/search_cubit/search_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    String searchQuery = '';
    return TextField(
      onSubmitted: (value) {
        context.read<SearchCubit>().searchMovies(value);
      },
      onChanged: (value) {
        searchQuery = value;
      },
      decoration: InputDecoration(
        hintText: 'Search for movies',
        border: buildBorder(),
        focusedBorder: buildBorder(Color(0xffFFCC00)),
        enabledBorder: buildBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            context.read<SearchCubit>().searchMovies(searchQuery);
          },
          icon: Icon(Icons.search),
        ),
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
