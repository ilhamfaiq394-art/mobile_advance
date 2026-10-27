import 'dart:io';
void main() {
print("Apakah anda ingin menginstall aplikasi? (y/t): ");
String? input = stdin.readLineSync();
input == 'y' || input == 'Y'
? print("anda akan menginstall aplikasi dart")
: (input == 't' || input == 'T' ? print("aborted") : print("Pilihan tidak valid"));
}