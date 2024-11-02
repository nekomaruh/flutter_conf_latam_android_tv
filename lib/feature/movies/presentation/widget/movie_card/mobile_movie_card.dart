import 'package:flutter/material.dart';
import '../../../domain/entity/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.movie,
    required this.index,
    this.onTap,
    super.key,
  });

  final int index;
  final GestureTapCallback? onTap;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.name,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(20),
        child: Material(
          child: Ink.image(
            image: AssetImage('assets/images/${movie.id}.png'),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: onTap,
              focusColor: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
