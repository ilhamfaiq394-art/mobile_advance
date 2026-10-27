import 'package:flutter/material.dart';

class Acara22Screen extends StatefulWidget {
  @override
  _Acara22ScreenState createState() => _Acara22ScreenState();
}

class _Acara22ScreenState extends State<Acara22Screen> {
  final PageController _pageController = PageController();

  // Fungsi untuk pindah ke halaman berikutnya
  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Fungsi untuk pindah ke halaman sebelumnya
  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acara 22 - PageView with Images"),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Stack(
        children: [
          // PageView Utama
          PageView(
            controller: _pageController,
            children: <Widget>[
              // Halaman 1 dengan Gambar Asset
              SizedBox.expand(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/img/gambar.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black38,
                      child: Center(
                        child: Text(
                          "Halaman 1 (PageView)",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Halaman 2 dengan Gambar Asset
              SizedBox.expand(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/img/drogba.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black38,
                      child: Center(
                        child: Text(
                          "Halaman 2 (PageView)",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Halaman 3 (Halamandua)
              Acara22HalamanTiga(),
            ],
          ),
          
          // Tombol Navigasi Kiri (Opsional untuk memudahkan di Browser)
          Positioned(
            left: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.black45,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  onPressed: _previousPage,
                ),
              ),
            ),
          ),

          // Tombol Navigasi Kanan (Opsional untuk memudahkan di Browser)
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.black45,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: _nextPage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Acara22HalamanTiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade700,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Halaman Ketiga (Halamandua)",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade200,
                foregroundColor: Colors.indigo.shade900,
              ),
              onPressed: () {},
              child: Text("Tombol Halaman 3"),
            ),
          ],
        ),
      ),
    );
  }
}