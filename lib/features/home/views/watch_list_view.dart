import 'package:flutter/material.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: 2,
      ),
    );
  }
}
