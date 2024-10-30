import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/setup_di.dart';
import '../../../../core/framework/platform.dart';
import '../controller/movies_bloc.dart';
import '../widget/movie_details.dart';
import '../widget/movie_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (_) => MoviesBloc(sl()),
      child: const MoviesPage(),
    );
  }
}

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MoviesBloc>().add(MoviesFetchEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesScreen = Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // GRID
        Expanded(
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesFetchingSuccessState) {
                return MovieGrid(
                  movies: state.response,
                  onTapMovie: (movie) => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MovieDetails(movie: movie);
                      },
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Movies',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: MyPlatform.isTv ? moviesScreen : SafeArea(child: moviesScreen),
    );
  }
}
