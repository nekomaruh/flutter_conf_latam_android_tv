import 'package:flutter_conf_android_tv/feature/movies/data/repository/movies_repository_impl.dart';
import 'package:flutter_conf_android_tv/feature/movies/domain/repository/movies_repository.dart';
import 'package:flutter_conf_android_tv/feature/movies/domain/usecase/get_movies_usecase.dart';

import '../../../../core/di/setup_di.dart';

setupMoviesFeature() {
  sl.registerSingleton<MoviesRepository>(MoviesRepositoryImpl());
  sl.registerSingleton(GetMoviesUseCase(sl()));
}
