class Lingkaran {
  // Variabel privat untuk enkapsulasi
  double _radius = 0.0;

  // Setter dengan validasi: jika input negatif, dikalikan -1 agar positif
  void set jariJari(double value) {
    if (value < 0) {
      _radius = value * -1;
    } else {
      _radius = value;
    }
  }

  // Getter untuk mengambil nilai jari-jari
  double get jariJari => _radius;

  // Getter untuk menghitung luas lingkaran (phi * r * r)
  double get luas => 3.14 * _radius * _radius;
}