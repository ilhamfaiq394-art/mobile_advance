import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Acara38ApiDashboard extends StatefulWidget {
  final User user; // Menerima data user dari Acara 37
  final VoidCallback onLogout; // Menerima fungsi logout dari Acara 37

  const Acara38ApiDashboard({
    super.key, 
    required this.user, 
    required this.onLogout
  });

  @override
  State<Acara38ApiDashboard> createState() => _Acara38ApiDashboardState();
}

class _Acara38ApiDashboardState extends State<Acara38ApiDashboard> {
  List<dynamic> _apiData = [];
  bool _isLoadingApi = false;

  // Fungsi Pengambilan API (Acara 38)
  Future<void> _fetchApiData() async {
    setState(() {
      _isLoadingApi = true;
    });

    try {
      final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _apiData = data['data'];
        });
      } else {
        throw Exception('Gagal memuat API');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error API: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      setState(() {
        _isLoadingApi = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acara 38 - Auth & API'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: widget.onLogout, // Memanggil fungsi logout dari file 1
            tooltip: 'Logout',
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // KARTU PROFIL USER (Mengambil data dari Firebase Auth)
            Card(
              elevation: 4,
              color: Colors.teal.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user.email ?? 'Email tidak ditemukan',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text('UID: ${widget.user.uid}', style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // BAGIAN AMBIL API
            const Text(
              'Pengambilan API (Data Reqres.in):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isLoadingApi ? null : _fetchApiData,
                icon: const Icon(Icons.download),
                label: Text(_isLoadingApi ? 'Memuat Data...' : 'Ambil Data API'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // LIST HASIL API
            if (_apiData.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _apiData.length,
                itemBuilder: (context, index) {
                  final userApi = _apiData[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(userApi['avatar']),
                      ),
                      title: Text('${userApi['first_name']} ${userApi['last_name']}'),
                      subtitle: Text(userApi['email']),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}