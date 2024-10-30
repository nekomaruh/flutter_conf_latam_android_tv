import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_android_tv/feature/movies/domain/entity/movie.dart';
import 'package:flutter_conf_android_tv/feature/movies/domain/usecase/get_movies_usecase.dart';
import 'package:meta/meta.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetMoviesUseCase getMoviesUseCase;

  MoviesBloc(this.getMoviesUseCase) : super(MoviesInitial()) {
    on<MoviesFetchEvent>((event, emit) async {
      emit(MoviesFetchingState());
      try {
        final response = await getMoviesUseCase(params: GetMoviesParams());
        emit(MoviesFetchingSuccessState(response));
      } catch (e) {
        emit(MoviesFetchingFailureState("Error loading movies"));
      }
    });
  }
}
