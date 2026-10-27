// ============================================================
// BINDING — Acara 31 (Dependency Management)
// Binding bertugas meng-inject controller ke halaman.
// Saat halaman dibuat, Binding akan otomatis mendaftarkan
// controller-nya lewat Get.lazyPut / Get.put.
// ============================================================
import 'package:get/get.dart';
import '../controller/hitung_controller.dart';

class HitungBinding extends Bindings {
  @override
  void dependencies() {
    // lazyPut -> controller baru dibuat saat pertama kali dipakai
    Get.lazyPut<HitungController>(() => HitungController());
  }
}