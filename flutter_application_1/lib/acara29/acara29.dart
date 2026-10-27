// ============================================================
// ENTRY POINT — Acara 29-32
// Menggunakan GetMaterialApp dengan initialRoute & getPages.
// ============================================================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class Acara29Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Acara 29-32',
      debugShowCheckedModeBanner: false,

      // Rute awal = halaman pertama
      initialRoute: AppRoutes.HOME,

      // Daftar semua route (dari app_pages.dart)
      getPages: AppPages.pages,
    );
  }
}