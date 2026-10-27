// ============================================================
// CONTROLLER — Acara 30 (State Management)
// Menyimpan state counter dengan ".obs" (reactive).
// ============================================================
import 'package:get/get.dart';

class HitungController extends GetxController {
  // State reactive
  var counter = 0.obs;

  // Aksi
  void increment() => counter.value++;

  void decrement() {
    if (counter.value > 0) counter.value--;
  }

  void reset() => counter.value = 0;
}