import 'package:flutter/material.dart';
import 'package:flutter_conf_android_tv/feature/movies/presentation/widget/scale_widget.dart';
import 'package:flutter_conf_android_tv/feature/movies/presentation/widget/video_player.dart';

import '../../../../core/extension/focus_ext.dart';
import '../../../../core/framework/platform.dart';
import '../../domain/entity/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[
      const SizedBox(
        height: 10.0,
      ),
      Center(
        child: Text(
          movie.name,
          style: TextStyle(
            fontSize: MyPlatform.isTv ? 48.0 : 24.0,
            color: MyPlatform.isTv ? Colors.white : Colors.black,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
        child: Text(
          movie.meta,
          style: TextStyle(
            fontSize: MyPlatform.isTv ? 32.0 : 16.0,
            color: MyPlatform.isTv ? Colors.white : Colors.black,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Text(
          movie.synopsis,
          style: TextStyle(
            fontSize: MyPlatform.isTv ? 16.0 : 12.0,
            color: MyPlatform.isTv ? Colors.white : Colors.black,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Text(
          'Rating: ${movie.rating}',
          style: TextStyle(
            fontSize: MyPlatform.isTv ? 28.0 : 14.0,
            color: MyPlatform.isTv ? Colors.white : Colors.black,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              autofocus: true,
              style: ElevatedButton.styleFrom(
                elevation: 10.0,
                backgroundColor: Colors.redAccent,
              ),
              child: Text(
                'Trailer',
                style: TextStyle(
                  fontSize: MyPlatform.isTv ? 24.0 : 16.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return PlayerPage(path: 'assets/videos/${movie.id}.mp4');
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    ];

    return Material(
      child: MyPlatform.isTv ? getTvDetails(widgets) : getDetails(widgets),
    );
  }

  Widget getDetails(List<Widget> widgets) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: movie.name,
                child: Image.asset(
                  'assets/images/${movie.id}.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(widgets),
          ),
        ],
      ),
    );
  }

  Widget getTvDetails(List<Widget> widgets) {
    final details = Scaffold(
      body: Stack(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) => Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Hero(
                tag: movie.name,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/${movie.id}.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: widgets),
        ],
      ),
    );

    return isScaled ? ScaleWidget(child: details) : details;
  }
}
