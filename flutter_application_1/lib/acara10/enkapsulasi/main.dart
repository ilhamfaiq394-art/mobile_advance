import 'lingkaran.dart';

void main(List<String> args) {
  var lingkaran = Lingkaran();

  // Uji coba memasukkan nilai negatif (contoh: -14)
  lingkaran.jariJari = -14;

  // Menampilkan hasil jari-jari setelah divalidasi dan luas lingkaran
  print("Jari-jari setelah validasi: ${lingkaran.jariJari}");
  print("Luas Lingkaran: ${lingkaran.luas}");
}