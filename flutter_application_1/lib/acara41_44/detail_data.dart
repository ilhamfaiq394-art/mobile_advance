import 'package:flutter/material.dart';
import 'model_barang.dart';

class DetailDataScreen extends StatelessWidget {
  final Barang barang;
  const DetailDataScreen({super.key, required this.barang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Barang (Read)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID Barang: ${barang.id}', style: const TextStyle(color: Colors.grey)),
                const Divider(),
                const SizedBox(height: 8),
                Text('Nama Barang:', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                Text(barang.namaBarang, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text('Harga:', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                Text('Rp ${barang.harga}', style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}