part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesFetchingState extends MoviesState {}

class MoviesFetchingFailureState extends MoviesState {
final String message;

  MoviesFetchingFailureState(this.message);
}

class MoviesFetchingSuccessState extends MoviesState {
  final List<Movie> response;
    MoviesFetchingSuccessState(this.response);


}

class MoviesPostingState extends MoviesState {}

class MoviesPostingFailureState extends MoviesState {
final String message;

  MoviesPostingFailureState(this.message);
}

class MoviesPostingSuccessState extends MoviesState {
  final List<Movie> response;
    MoviesPostingSuccessState(this.response);

}

