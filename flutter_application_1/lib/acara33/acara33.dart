import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestApi33 extends StatefulWidget {
  const RestApi33({super.key});

  @override
  State<RestApi33> createState() => _RestApi33State();
}

class _RestApi33State extends State<RestApi33> {
  List<dynamic> pengguna = [];
  bool loading = false;
  String pesan = '';

  Future<void> ambilData() async {
    setState(() {
      loading = true;
      pesan = '';
    });

    try {
      final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=2'),
      );

      if (response.statusCode == 200) {
        final hasil = jsonDecode(response.body);

        setState(() {
          pengguna = hasil['data'];
          pesan = 'Data berhasil diambil';
        });
      } else {
        setState(() {
          pesan =
              'Gagal mengambil data. Kode: ${response.statusCode}. '
              'Periksa akses API.';
        });
      }
    } catch (e) {
      setState(() {
        pesan = 'Koneksi gagal. Periksa internet dan akses API.';
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acara 33 - REST API'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: loading ? null : ambilData,
                icon: const Icon(Icons.cloud_download),
                label: const Text('Ambil Data dari API'),
              ),
            ),
            const SizedBox(height: 12),
            if (loading)
              const CircularProgressIndicator(),
            if (pesan.isNotEmpty)
              Text(
                pesan,
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: pengguna.length,
                itemBuilder: (context, index) {
                  final user = pengguna[index];

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${user['id']}'),
                      ),
                      title: Text(
                        '${user['first_name']} '
                        '${user['last_name']}',
                      ),
                      subtitle: Text(user['email'] ?? ''),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}