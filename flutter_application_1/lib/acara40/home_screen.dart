import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreenMovieDB extends StatefulWidget {
  const HomeScreenMovieDB({super.key});

  @override
  State<HomeScreenMovieDB> createState() => _HomeScreenMovieDBState();
}

class _HomeScreenMovieDBState extends State<HomeScreenMovieDB> {
  // GANTI DENGAN API KEY TMDB ANDA
  final String apiKey = '2ea5a3733ef6d1d254fe67fb904ae3ce'; 
  
  List<dynamic> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  // Fungsi untuk mengambil data dari API MovieDB
  Future<void> fetchMovies() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1');
    
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          movies = data['results'];
          isLoading = false;
        });
      } else {
        throw Exception('Gagal memuat data movie');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acara 40 - MovieDB API'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                // Mengambil URL poster dari TMDB
                final String posterPath = movie['poster_path'] != null
                    ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
                    : '';

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: posterPath.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              posterPath,
                              width: 60,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.movie, size: 60),
                    title: Text(
                      movie['title'] ?? 'No Title',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text('Release: ${movie['release_date'] ?? '-'}'),
                        Text('Rating: ⭐ ${movie['vote_average'] ?? '-'}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}