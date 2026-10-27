import 'bangun_datar.dart';

class Segitiga extends BangunDatar {
  double alas;
  double tinggi;
  double sisiMiring; // Sisi ketiga (hipotenusa) untuk keliling segitiga siku-siku

  Segitiga(this.alas, this.tinggi, this.sisiMiring);

  @override
  double luas() {
    return 0.5 * alas * tinggi;
  }

  @override
  double keliling() {
    // Keliling segitiga siku-siku = alas + tinggi + sisiMiring
    return alas + tinggi + sisiMiring;
  }
}