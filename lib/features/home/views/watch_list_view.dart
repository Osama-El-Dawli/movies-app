import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/features/home/models/movie_model.dart';
import 'package:movies_app/features/home/widgets/movie_item.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ValueListenableBuilder(
        valueListenable: Hive.box('watchList').listenable(),
        builder: (context, value, child) {
          if (value.isEmpty) {
            return Center(
              child: SizedBox(
                width: 500,
                child: LottieBuilder.asset(
                  'assets/pop_corn.json',
                  repeat: false,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final MovieModel movie = MovieModel.fromJson(
                Hive.box('watchList').getAt(index),
              );
              return MovieItem(movie: movie);
            },
            itemCount: Hive.box('watchList').length,
          );
        },
      ),
    );
  }
}
