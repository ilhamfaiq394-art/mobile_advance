// ============================================================
// VIEW — Halaman Utama
// Menampilkan counter reactive + tombol navigasi Get.toNamed.
// ============================================================
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/hitung_controller.dart';
import '../routes/app_routes.dart';

class HalamanSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ambil controller dari GetX container
    final controller = Get.find<HitungController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Acara 29 - 32: GetX Management'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ===== SUB JUDUL =====
            Text(
              'Demonstrasi State, Route, & Dependency Management dengan GetX',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 40),

            // ===== COUNTER REACTIVE =====
            Obx(() => Text(
                  'Counter Reactive (.obs): ${controller.counter.value}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                )),
            SizedBox(height: 24),

            // ===== TOMBOL INCREMENT =====
            ElevatedButton(
              onPressed: controller.increment,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Increment Count', style: TextStyle(fontSize: 15)),
            ),
            SizedBox(height: 12),

            // ===== TOMBOL NAVIGASI (Get.toNamed) =====
            ElevatedButton(
              onPressed: () {
                // Navigasi pakai nama route
                Get.toNamed(AppRoutes.DEMO);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Pindah ke Demo Page (Get.toNamed)',
                  style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}