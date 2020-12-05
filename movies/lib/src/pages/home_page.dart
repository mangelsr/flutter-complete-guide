import 'package:flutter/material.dart';

import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widgets/card_swiper.dart';
import 'package:movies/src/widgets/horizontal_movies.dart';
import 'package:movies/src/widgets/search_delegate.dart';

class HomePage extends StatelessWidget {
  final MoviesProvider moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    moviesProvider.getPopular();
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies in teathres'),
          backgroundColor: Colors.indigo,
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(),
                );
              },
            )
          ],
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _cardsSwiper(),
            _popularMovies(context),
          ],
        )));
  }

  Widget _cardsSwiper() {
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData && snapshot.data.length > 0) {
          return CardSwiper(movies: snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _popularMovies(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Popular',
                style: Theme.of(context).textTheme.subhead,
              )),
          SizedBox(
            height: 10.0,
          ),
          StreamBuilder(
            stream: moviesProvider.popularStream,
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData && snapshot.data.length > 0) {
                return HorizontalMovies(
                  movies: snapshot.data,
                  nextPage: moviesProvider.getPopular,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
