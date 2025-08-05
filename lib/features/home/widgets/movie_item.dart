import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/features/home/models/movie_model.dart';

class MovieItem extends StatefulWidget {
  const MovieItem({super.key, required this.movie});
  final MovieModel movie;

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    bool isBookmarked = Hive.box('watchList').containsKey(widget.movie.id);
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: ApiConstants.imageUrl + (widget.movie.image ?? ''),
            fit: BoxFit.fitHeight,
            placeholder: (context, url) =>
                LottieBuilder.asset('assets/loading.json', width: 50),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        title: Text(
          widget.movie.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          widget.movie.subTitle ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              isBookmarked = !isBookmarked;
            });
            if (isBookmarked) {
              Hive.box('watchList').put(widget.movie.id, widget.movie.toMap());
            } else {
              Hive.box('watchList').delete(widget.movie.id);
            }
          },
          icon: isBookmarked
              ? Icon(Icons.bookmark, color: Color(0xffFF8C00))
              : Icon(Icons.bookmark_outline),
        ),
      ),
    );
  }
}
