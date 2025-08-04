import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/features/home/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: ApiConstants.imageUrl + (movie.image ?? ''),
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        title: Text(
          movie.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          movie.subTitle ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.bookmark_outline),
        ),
      ),
    );
  }
}
