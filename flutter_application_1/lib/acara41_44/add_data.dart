import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();
  bool _isLoading = false;

  Future<void> _simpanData() async {
    if (_namaController.text.isEmpty || _hargaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua kolom harus diisi!'), backgroundColor: Colors.orange),
      );
      return;
    }
    
    setState(() => _isLoading = true);
    try {
      // URL MockAPI Anda
      final response = await http.post(
        Uri.parse('https://6ad62812f71f154ac4868f2c.mockapi.io/barang'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nama_barang': _namaController.text,
          'harga': _hargaController.text,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        if (mounted) Navigator.pop(context, true); 
      } else {
        throw Exception('Gagal menyimpan data (Status: ${response.statusCode})');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Barang'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Barang', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _hargaController,
              decoration: const InputDecoration(labelText: 'Harga', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
                onPressed: _isLoading ? null : _simpanData,
                child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Simpan Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}