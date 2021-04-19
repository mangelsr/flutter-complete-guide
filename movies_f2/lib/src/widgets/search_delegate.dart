import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate {
  final MoviesProvider moviesProvider = MoviesProvider();

  final movies = [
    'Spiderman',
    'Superman',
    'Aquaman',
    'Batman',
    'Shazam',
    'Iron Man',
    'Iron Man 2',
    'Iron Man 3',
    'Captan America'
  ];

  final recentMovies = ['Spiderman', 'Captan America'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro appbar ej. Icono de cancelar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder de los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando las personas escriben
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: moviesProvider.searchMovie(query),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(movies[index].getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  title: Text(movies[index].title),
                  subtitle: Text(movies[index].originalTitle),
                  onTap: () {
                    close(context, null);
                    movies[index].uniqueId = '';
                    Navigator.pushNamed(context, 'detail', arguments: movies[index]);
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }
}
