import 'titan.dart';
import 'human.dart';
import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';

void main(List<String> args) {
  // 1. Inisialisasi objek dari masing-masing class
  var human = Human();
  var armorTitan = ArmorTitan();
  var attackTitan = AttackTitan();
  var beastTitan = BeastTitan();

  // 2. Mengisi value powerPoint (Sengaja memasukkan angka di bawah 5 untuk menguji validasi)
  human.powerPoint = 3;        // Akan otomatis menjadi 5
  armorTitan.powerPoint = 8;   // Tetap 8
  attackTitan.powerPoint = 2;  // Akan otomatis menjadi 5
  beastTitan.powerPoint = 10;  // Tetap 10

  // 3. Menampilkan Power Point dan aksi dari masing-masing class
  print("=== HUMAN ===");
  print("Power Point : ${human.powerPoint}");
  print("Aksi        : ${human.killAlltitan()}\n");

  print("=== ARMOR TITAN ===");
  print("Power Point : ${armorTitan.powerPoint}");
  print("Aksi        : ${armorTitan.terjang()}\n");

  print("=== ATTACK TITAN ===");
  print("Power Point : ${attackTitan.powerPoint}");
  print("Aksi        : ${attackTitan.punch()}\n");

  print("=== BEAST TITAN ===");
  print("Power Point : ${beastTitan.powerPoint}");
  print("Aksi        : ${beastTitan.lempar()}\n");
}