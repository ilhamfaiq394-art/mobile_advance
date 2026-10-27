void main () {
  var angka = 8; 
print(angka == "8"); // true, padahal "8" adalah string. 
print(angka === "8"); // false, karena tipe data nya berbeda 
print(angka === 8); // true
}