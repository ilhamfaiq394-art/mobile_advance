import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model_barang.dart';
import 'add_data.dart';
import 'edit_data.dart';

class MainCrudScreen extends StatefulWidget {
  const MainCrudScreen({super.key});

  @override
  State<MainCrudScreen> createState() => _MainCrudScreenState();
}

class _MainCrudScreenState extends State<MainCrudScreen> {
  List<Barang> listBarang = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // FUNGSI READ (GET)
  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      // URL MockAPI Anda
      final response = await http.get(
        Uri.parse('https://6ad62812f71f154ac4868f2c.mockapi.io/barang')
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          listBarang = (data as List).map((json) => Barang.fromJson(json)).toList();
        });
      } else {
        throw Exception('Gagal memuat data (Status: ${response.statusCode})');
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // FUNGSI DELETE
  Future<void> _hapusData(String id) async {
    try {
      // URL MockAPI Anda + ID Barang
      final response = await http.delete(
        Uri.parse('https://6ad62812f71f154ac4868f2c.mockapi.io/barang/$id')
      );
      
      if (response.statusCode == 200 || response.statusCode == 204) {
        _fetchData(); // Refresh list
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data berhasil dihapus'), backgroundColor: Colors.green),
          );
        }
      }
    } catch (e) {
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
        title: const Text('Acara 41-44 (Data Barang)'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchData,
            tooltip: 'Refresh Data',
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Terjadi Kesalahan:\n$_errorMessage', 
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 16)
                    ),
                  ),
                )
              : listBarang.isEmpty
                  ? const Center(child: Text('Data Kosong. Silakan tambah data.'))
                  : ListView.builder(
                      itemCount: listBarang.length,
                      itemBuilder: (context, index) {
                        final barang = listBarang[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: Icon(Icons.inventory, color: Colors.white),
                            ),
                            title: Text(barang.namaBarang, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('Rp ${barang.harga}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => EditDataScreen(barang: barang)),
                                    );
                                    if (result == true) _fetchData();
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _konfirmasiHapus(barang),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddDataScreen()),
          );
          if (result == true) _fetchData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _konfirmasiHapus(Barang barang) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: Text('Yakin ingin menghapus ${barang.namaBarang}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _hapusData(barang.id);
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}