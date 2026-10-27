// ============================================================
// MODEL — Acara 29 (Pengenalan)
// Model sederhana untuk demo data.
// ============================================================

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

// Data dummy
final List<Product> sampleProducts = [
  Product(id: 1, name: 'Kopi Arabika', price: 25000),
  Product(id: 2, name: 'Teh Hijau Premium', price: 15000),
  Product(id: 3, name: 'Susu Segar Murni', price: 20000),
];