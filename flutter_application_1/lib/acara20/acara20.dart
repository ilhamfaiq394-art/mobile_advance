import 'package:flutter/material.dart';

class Acara20Screen extends StatefulWidget {
  @override
  _Acara20ScreenState createState() => _Acara20ScreenState();
}

class _Acara20ScreenState extends State<Acara20Screen> {
  int _currentIndex = 0;

  // Daftar halaman untuk Bottom Navigation Bar (Home, Search, Account)
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acara 20 - Drawer & Tab Nav'),
        backgroundColor: Colors.indigo.shade400,
      ),
      // 1. Drawer Navigator di sebelah kiri
      drawer: AppDrawer(),
      body: _pages[_currentIndex],
      // 2. Bottom Tab Navigator
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.indigo.shade700,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

// Widget untuk Drawer Samping Kiri
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Muhammad Ilham Rifqia Faiq F.R"),
            accountEmail: Text("ilham@gmail.com"),
           // Mengubah inisial teks MI menjadi foto profil menggunakan asset
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.indigo.shade200,
              backgroundImage: AssetImage('assets/img/gambar.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.indigo.shade400,
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.indigo.shade600),
            title: Text('Menu Utama'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.indigo.shade600),
            title: Text('Pengaturan'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.indigo.shade600),
            title: Text('Keluar'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

// Halaman Tab 1: Home (Dilengkapi Navigasi ke Halaman Lain)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selamat Datang di Halaman Home',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade800,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo.shade400,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              // 3. Navigasi push ke halaman detail
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage()),
              );
            },
            child: Text('Buka Halaman Detail (Push Navigation)'),
          ),
        ],
      ),
    );
  }
}

// Halaman Tab 2: Search (Hanya Berisi Kotak Pencarian / Search Bar)
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selamat Datang di Halaman Search',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade800,
            ),
          ),
          SizedBox(height: 20),
          // Kotak / TextField Search
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari sesuatu...',
              prefixIcon: Icon(Icons.search, color: Colors.indigo.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo.shade400, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Tab 3: Akun
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Selamat Datang di Halaman Akun',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade800,
        ),
      ),
    );
  }
}

// Halaman Detail untuk demonstrasi Navigator.pop
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Detail'),
        backgroundColor: Colors.indigo.shade600,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang di Halaman Detail!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade600,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}