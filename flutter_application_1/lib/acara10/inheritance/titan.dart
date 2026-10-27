class Titan {
  int _powerPoint = 0;

  // Setter dengan validasi: jika powerPoint di bawah 5, maka otomatis di-set menjadi 5
  void set powerPoint(int value) {
    if (value < 5) {
      _powerPoint = 5;
    } else {
      _powerPoint = value;
    }
  }

  // Getter untuk mengambil nilai powerPoint
  int get powerPoint => _powerPoint;
}