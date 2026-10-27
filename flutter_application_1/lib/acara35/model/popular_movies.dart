
class PopularMovies {
  final List<Results> results;

  PopularMovies({required this.results});

  factory PopularMovies.fromJson(Map<String, dynamic> json) {
    return PopularMovies(
      results: (json['results'] as List<dynamic>? ?? [])
          .map((item) => Results.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Results {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String releaseDate;
  final double voteAverage;

  Results({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Judul tidak tersedia',
      overview: json['overview'] ?? 'Deskripsi tidak tersedia',
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? '-',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    );
  }

  String get posterUrl {
    if (posterPath == null || posterPath!.isEmpty) {
      return '';
    }
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }
}
