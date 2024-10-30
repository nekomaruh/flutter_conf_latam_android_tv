import 'package:flutter_conf_android_tv/core/usecase/usecase.dart';
import 'package:flutter_conf_android_tv/feature/movies/domain/repository/movies_repository.dart';

import '../entity/movie.dart';

class GetMoviesParams {}

class GetMoviesUseCase extends UseCase<Future<List<Movie>>, GetMoviesParams> {
  final MoviesRepository repository;

  GetMoviesUseCase(this.repository);

  @override
  Future<List<Movie>> call({required GetMoviesParams params}) async {
    return await repository.getMovies();
  }
}
