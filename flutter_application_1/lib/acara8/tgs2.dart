import 'dart:io';

void main() {
  stdout.write("Masukkan nama: ");
  String? nama = stdin.readLineSync();
  // 
  stdout.write("Masukkan peran (Penyihir / Guard / Werewolf): ");
  String? peran = stdin.readLineSync();

  if (nama == null || nama.trim().isEmpty) {
    print("Nama harus diisi!");
  } else if (peran == null || peran.trim().isEmpty) {
    print("Halo $nama, Pilih peranmu untuk memulai game!");
  } else if (peran.toLowerCase() == 'penyihir') {
    print("Selamat datang di Dunia Werewolf, $nama");
    print("Halo Penyihir $nama, kamu dapat melihat siapa yang menjadi werewolf!");
  } else if (peran.toLowerCase() == 'guard') {
    print("Selamat datang di Dunia Werewolf, $nama");
    print("Halo Guard $nama, kamu akan membantu melindungi temanmu dari serangan werewolf.");
  } else if (peran.toLowerCase() == 'werewolf') {
    print("Selamat datang di Dunia Werewolf, $nama");
    print("Halo Werewolf $nama, Kamu akan memakan mangsa setiap malam!");
  } else {
    print("Peran tidak valid! Pilih antara Penyihir, Guard, atau Werewolf.");
  }
}