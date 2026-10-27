class Employee {
  int id;
  String name;
  String department;

  // Constructor untuk menginisialisasi nilai properti
  Employee(this.id, this.name, this.department);

  // Method opsional untuk menampilkan data karyawan dengan rapi
  void tampilkanInfo() {
    print("ID         : $id");
    print("Nama       : $name");
    print("Departemen : $department\n");
  }
}