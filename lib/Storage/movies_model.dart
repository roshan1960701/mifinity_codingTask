class Movie {
  final String title;
  final String image;
  final List<String> genre;

  Movie({required this.title, required this.image, required this.genre});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      image: json['image'],
      genre: List<String>.from(json['genre']),
    );
  }
}

class MovieCategory {
  final String category;
  final List<Movie> movies;

  MovieCategory({required this.category, required this.movies});

  factory MovieCategory.fromJson(Map<String, dynamic> json) {
    var moviesJson = json['movies'] as List;
    List<Movie> movieList = moviesJson.map((i) => Movie.fromJson(i)).toList();

    return MovieCategory(
      category: json['category'],
      movies: movieList,
    );
  }
}
