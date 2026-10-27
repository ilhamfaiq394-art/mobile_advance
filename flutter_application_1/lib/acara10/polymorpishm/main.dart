import 'bangun_datar.dart';
import 'persegi.dart';
import 'lingkaran.dart';
import 'segitiga.dart';

void main(List<String> args) {
  // Menggunakan prinsip polimorfisme: Variabel bertipe BangunDatar menampung objek turunannya
  BangunDatar bangunDatar = BangunDatar();
  BangunDatar persegi = Persegi(5.0);        // Sisi = 5
  BangunDatar lingkaran = Lingkaran(7.0);   // Jari-jari = 7
  BangunDatar segitiga = Segitiga(3.0, 4.0, 5.0); // Alas = 3, Tinggi = 4, Sisi Miring = 5

  print("=== BANGUN DATAR (DEFAULT) ===");
  print("Luas     : ${bangunDatar.luas()}");
  print("Keliling : ${bangunDatar.keliling()}\n");

  print("=== PERSEGI (Sisi: 5) ===");
  print("Luas     : ${persegi.luas()}");
  print("Keliling : ${persegi.keliling()}\n");

  print("=== LINGKARAN (Jari-jari: 7) ===");
  print("Luas     : ${lingkaran.luas()}");
  print("Keliling : ${lingkaran.keliling()}\n");

  print("=== SEGITIGA SIKU-SIKU (Alas: 3, Tinggi: 4, Sisi Miring: 5) ===");
  print("Luas     : ${segitiga.luas()}");
  print("Keliling : ${segitiga.keliling()}");
}