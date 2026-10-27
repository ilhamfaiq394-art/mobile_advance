// ============================================================
// APP PAGES — Acara 32 (Route Management)
// Daftar GetPage yang menghubungkan nama route ke halaman.
// ============================================================
import 'package:get/get.dart';
import '../binding/hitung_binding.dart';
import '../view/halaman_satu.dart';
import '../view/demo_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HalamanSatu(),
      binding: HitungBinding(), // binding mendaftarkan controller
    ),
    GetPage(
      name: AppRoutes.DEMO,
      page: () => DemoPage(),
      binding: HitungBinding(), // binding yang sama
    ),
  ];
}