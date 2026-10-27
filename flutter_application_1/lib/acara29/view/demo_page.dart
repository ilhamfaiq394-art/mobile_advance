// ============================================================
// VIEW — Halaman Kedua
// Menampilkan counter yang SAMA (persist antar halaman).
// ============================================================
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/hitung_controller.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.find -> ambil controller yang sudah didaftarkan
    final controller = Get.find<HitungController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Acara 31-32: Demo Page'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Counter reactive — nilainya sama dengan halaman 1
            Obx(() => Text(
                  'Nilai Hitung: ${controller.counter.value}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
            SizedBox(height: 24),
            OutlinedButton(
              onPressed: controller.increment,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: BorderSide(color: Colors.blue.shade200),
                foregroundColor: Colors.blue,
              ),
              child: Text('Tambah Angka', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}