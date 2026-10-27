class Barang {
  final String id;
  final String namaBarang;
  final String harga;

  Barang({required this.id, required this.namaBarang, required this.harga});

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: json['id'].toString(),
      namaBarang: json['nama_barang']?.toString() ?? 'Tanpa Nama',
      harga: json['harga']?.toString() ?? '0',
    );
  }
}