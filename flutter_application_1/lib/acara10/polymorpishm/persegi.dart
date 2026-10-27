import 'bangun_datar.dart';

class Persegi extends BangunDatar {
  double sisi;

  Persegi(this.sisi);

  @override
  double luas() {
    return sisi * sisi;
  }

  @override
  double keliling() {
    return 4 * sisi;
  }
}