import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model_barang.dart';

class EditDataScreen extends StatefulWidget {
  final Barang barang;
  const EditDataScreen({super.key, required this.barang});

  @override
  State<EditDataScreen> createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  late TextEditingController _namaController;
  late TextEditingController _hargaController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.barang.namaBarang);
    _hargaController = TextEditingController(text: widget.barang.harga);
  }

  Future<void> _updateData() async {
    setState(() => _isLoading = true);
    try {
      // URL MockAPI Anda + ID Barang
      final response = await http.put(
        Uri.parse('https://6ad62812f71f154ac4868f2c.mockapi.io/barang/${widget.barang.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nama_barang': _namaController.text,
          'harga': _hargaController.text,
        }),
      );

      if (response.statusCode == 200) {
        if (mounted) Navigator.pop(context, true);
      } else {
        throw Exception('Gagal mengupdate data (Status: ${response.statusCode})');
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
      appBar: AppBar(title: const Text('Edit Barang'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
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
                onPressed: _isLoading ? null : _updateData,
                child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Update Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}