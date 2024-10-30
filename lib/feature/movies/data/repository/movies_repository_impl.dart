import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_conf_android_tv/feature/movies/domain/entity/movie.dart';
import 'package:flutter_conf_android_tv/feature/movies/domain/repository/movies_repository.dart';

import '../../domain/entity/movies_list.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  @override
  Future<List<Movie>> getMovies() async {
    return MoviesList.fromJson(
      await rootBundle.loadString('assets/service.json').then(
            (movies) => json.decode(movies),
          ),
    ).movies;
  }
}
