import 'package:flutter_conf_android_tv/feature/movies/domain/di/movies_di.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupDi() async {
  await setupMoviesFeature();
}