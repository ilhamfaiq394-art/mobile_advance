import 'package:flutter/material.dart';

import 'data/api_provider.dart';
import 'model/popular_movies.dart';
import 'acara36.dart'; // Sesuaikan path file Acara 36 Anda

class Acara35 extends StatefulWidget {
  const Acara35({super.key});

  @override
  State<Acara35> createState() => _Acara35State();
}

class _Acara35State extends State<Acara35> {
  final ApiProvider apiProvider = ApiProvider();
  late Future<PopularMovies> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = apiProvider.getPopularMovies();
  }

  void muatUlang() {
    setState(() {
      futureMovies = apiProvider.getPopularMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acara 35 - Film Populer'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Cari Film',
            onPressed: () => showSearch(
              context: context,
              delegate: MovieSearchDelegate(),
            ),
          ),
          IconButton(
            onPressed: muatUlang,
            icon: const Icon(Icons.refresh),
            tooltip: 'Muat ulang',
          ),
        ],
      ),
      body: FutureBuilder<PopularMovies>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return _buildErrorView(snapshot.error.toString());
          }

          final movies = snapshot.data?.results ?? [];

          if (movies.isEmpty) {
            return const Center(child: Text('Data film belum tersedia.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: movies.length,
            itemBuilder: (context, index) => _buildMovieCard(context, movies[index]),
          );
        },
      ),
    );
  }

  // Widget terpisah untuk Error agar bersih
  Widget _buildErrorView(String errorMsg) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 12),
            const Text('Gagal mengambil data film.', textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(errorMsg, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: muatUlang, child: const Text('Coba Lagi')),
          ],
        ),
      ),
    );
  }

  // Widget terpisah untuk Kartu Film (Membuat kode utama sangat ringkas)
  Widget _buildMovieCard(BuildContext context, Results movie) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => MovieDetailBottomSheet(movie: movie),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 14),
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 110,
                height: 160,
                child: movie.posterUrl.isEmpty
                    ? Container(
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.movie, size: 45),
                      )
                    : Image.network(
                        movie.posterUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.broken_image, size: 40),
                        ),
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text('Tanggal rilis: ${movie.releaseDate}'),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        Text(movie.voteAverage.toStringAsFixed(1)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.overview.isEmpty ? 'Deskripsi film belum tersedia.' : movie.overview,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// DELEGATE PENCARIAN (SEARCH DELEGATE)
// ==========================================
class MovieSearchDelegate extends SearchDelegate {
  final ApiProvider apiProvider = ApiProvider();

  @override
  String get searchFieldLabel => 'Cari judul film...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Masukkan kata kunci pencarian.'));
    }

    return FutureBuilder<PopularMovies>(
      future: apiProvider.searchMovies(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
        }

        final movies = snapshot.data?.results ?? [];
        if (movies.isEmpty) {
          return const Center(child: Text('Film tidak ditemukan.'));
        }

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              leading: SizedBox(
                width: 50,
                child: movie.posterUrl.isNotEmpty
                    ? Image.network(movie.posterUrl, fit: BoxFit.cover)
                    : const Icon(Icons.movie),
              ),
              title: Text(movie.title),
              subtitle: Text('Rilis: ${movie.releaseDate}'),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => MovieDetailBottomSheet(movie: movie),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Ketik judul film untuk mencari'));
    }
    return buildResults(context);
  }
}