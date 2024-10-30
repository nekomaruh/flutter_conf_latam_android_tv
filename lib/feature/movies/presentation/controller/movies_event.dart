part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class MoviesFetchEvent extends MoviesEvent {}

class MoviesPostEvent extends MoviesEvent {}

