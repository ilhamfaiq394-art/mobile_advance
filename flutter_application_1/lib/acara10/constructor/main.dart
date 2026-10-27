import 'employee.dart';

void main(List<String> args) {
  // Membuat objek employee pertama menggunakan constructor dengan data pribadi/teman
  var karyawan1 = Employee(101, "Muhammad Ilham", "Information Technology");
  
  // Membuat objek employee kedua
  var karyawan2 = Employee(102, "Budi Santoso", "Web Development");

  // Menampilkan informasi dari masing-masing objek
  print("=== DATA KARYAWAN 1 ===");
  karyawan1.tampilkanInfo();

  print("=== DATA KARYAWAN 2 ===");
  karyawan2.tampilkanInfo();
}