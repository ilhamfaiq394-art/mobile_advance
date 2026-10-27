import 'package:flutter/material.dart';

class Acara23Screen extends StatefulWidget {
  @override
  _Acara23ScreenState createState() => _Acara23ScreenState();
}

class _Acara23ScreenState extends State<Acara23Screen> {
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
        title: Text("Acara 23 - PageView & Dropdown"),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Stack(
        children: [
          // PageView Utama
          PageView(
            controller: _pageController,
            children: <Widget>[
              Container(
                color: Colors.indigo.shade200,
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
              Container(
                color: Colors.indigo.shade400,
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
              Acara23DropdownPage(),
            ],
          ),

          // Tombol Navigasi Kiri
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

          // Tombol Navigasi Kanan
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

class Pilihan {
  const Pilihan({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

List<Pilihan> listPilihan = const <Pilihan>[
  Pilihan(title: 'Car', icon: Icons.directions_car),
  Pilihan(title: 'Bicycle', icon: Icons.directions_bike),
  Pilihan(title: 'Boat', icon: Icons.directions_boat),
  Pilihan(title: 'Bus', icon: Icons.directions_bus),
  Pilihan(title: 'Train', icon: Icons.train),
];

class Acara23DropdownPage extends StatefulWidget {
  @override
  _Acara23DropdownPageState createState() => _Acara23DropdownPageState();
}

class _Acara23DropdownPageState extends State<Acara23DropdownPage> {
  Pilihan _selectedChoice = listPilihan[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade700,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Halaman Ketiga (Dropdown Menu)",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                DropdownButton<Pilihan>(
                  dropdownColor: Colors.indigo.shade800,
                  value: _selectedChoice,
                  icon: Icon(Icons.arrow_downward, color: Colors.white),
                  elevation: 16,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  underline: Container(
                    height: 2,
                    color: Colors.indigo.shade200,
                  ),
                  onChanged: (Pilihan? newValue) {
                    setState(() {
                      _selectedChoice = newValue!;
                    });
                  },
                  items: listPilihan.map<DropdownMenuItem<Pilihan>>((Pilihan pilihan) {
                    return DropdownMenuItem<Pilihan>(
                      value: pilihan,
                      child: Row(
                        children: [
                          Icon(pilihan.icon, color: Colors.white),
                          SizedBox(width: 12),
                          Text(pilihan.title),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  "Pilihan terpilih: ${_selectedChoice.title}",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}