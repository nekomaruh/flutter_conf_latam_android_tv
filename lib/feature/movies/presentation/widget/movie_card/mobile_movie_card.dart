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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          //splashColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${movie.id}.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
