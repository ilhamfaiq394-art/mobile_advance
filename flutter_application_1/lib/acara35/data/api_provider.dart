import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/popular_movies.dart';

class ApiProvider {
  static const String apiKey = '2ea5a3733ef6d1d254fe67fb904ae3ce';

  static const String baseUrl =
      'https://api.themoviedb.org/3/movie/popular';

  // Mengambil daftar film populer
  Future<PopularMovies> getPopularMovies() async {
    final uri = Uri.parse(baseUrl).replace(
      queryParameters: {
        'api_key': apiKey,
        'language': 'id-ID',
        'page': '1',
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return PopularMovies.fromJson(data);
    } else {
      throw Exception(
        'Gagal mengambil data film. Kode: ${response.statusCode}',
      );
    }
  }

  // Tambahan method untuk mencari film (Fitur Search)
  Future<PopularMovies> searchMovies(String query) async {
    final uri = Uri.parse('https://api.themoviedb.org/3/search/movie').replace(
      queryParameters: {
        'api_key': apiKey,
        'language': 'id-ID',
        'query': query,
        'page': '1',
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return PopularMovies.fromJson(data);
    } else {
      throw Exception('Gagal mencari film. Kode: ${response.statusCode}');
    }
  }
}