import 'bangun_datar.dart';

class Lingkaran extends BangunDatar {
  double jariJari;
  
  Lingkaran(this.jariJari);
  //menghitung luas lingkaran
  @override
  double luas() {
    return 3.14 * jariJari * jariJari;
  }
  //menghitung keliling lingkaran
  @override
  double keliling() {
    return 2 * 3.14 * jariJari;
  }
}