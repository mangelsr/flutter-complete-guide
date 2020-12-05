class Movies {
  List<Movie> items = List();

  Movies();

  Movies.fromJsonArray(List jsonArray) {
    if (jsonArray == null) return;
    items = jsonArray.map((element) => Movie.fromJson(element)).toList();
  }
}

class Movie {
  String uniqueId;
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  DateTime releaseDate;

  Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    // this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        // releaseDate: DateTime.parse(json["release_date"]),
      );

  Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "poster_path": posterPath,
        "id": id,
        "adult": adult,
        "backdrop_path": backdropPath,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "title": title,
        "vote_average": voteAverage,
        "overview": overview,
        // "release_date":
        //     "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
      };

  getPosterImg() {
    if (posterPath == null) {
      return 'https://wolper.com.au/wp-content/uploads/2017/10/image-placeholder.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  getBackImg() {
    if (backdropPath == null) {
      return 'https://wolper.com.au/wp-content/uploads/2017/10/image-placeholder.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }
}
