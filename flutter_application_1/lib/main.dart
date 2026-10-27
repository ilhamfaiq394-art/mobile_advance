import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Tambahan untuk Firebase

// Import Firebase Options hasil konfigurasi
import 'firebase_options.dart';

// Import Acara-acara sebelumnya
import 'acara15/acara15.dart';
import 'acara16/Telegram.dart';
import 'acara17/acara17.dart';
import 'acara18/acara18.dart';
import 'acara19/acara19.dart';
import 'acara20/acara20.dart';
import 'acara21/acara21.dart';
import 'acara22/acara22.dart';
import 'acara23/acara23.dart';
import 'acara25/acara25.dart'; // Acara 25-28
import 'acara29/acara29.dart'; // Acara 29-32 (GetX)
import 'acara34/get_data.dart'; // Acara 34 (REST API II)

// CUKUP IMPORT ACARA 35 SAJA
import 'acara35/acara35.dart'; // Acara 35 & 36 (REST API III & IV)

// Import Acara 37 & 38 (Gabungan)
import 'acara37-38/auth.dart'; 

// Import Acara 40 (MovieDB API)
import 'acara40/home_screen.dart'; 

// Import Acara 41-44 (CRUD FLUTTER)
import 'acara41_44/main_crud.dart'; // TAMBAHKAN INI

void main() async { 
  // Inisialisasi Firebase dengan opsi multi-platform (HP & Laptop)
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Praktikum',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Menu Acara'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ==================== ACARA 15 ====================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Acara15Screen()),
                    ),
                    child: Text('Buka Acara 15 (Widget Dasar)'),
                  ),
                ),
                SizedBox(height: 16),

                // ==================== ACARA 16 ====================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Telegram()),
                    ),
                    child: Text('Buka Acara 16 (Telegram)'),
                  ),
                ),
                SizedBox(height: 16),

                // ==================== ACARA 17 ====================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Acara17()),
                    ),
                    child: Text('Buka Acara 17 (Flutter Styling)'),
                  ),
                ),
                SizedBox(height: 16),

                // ==================== ACARA 18 ====================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Acara18Screen()),
                    ),
                    child: Text('Buka Acara 18 (Belajar Routing)'),
                  ),
                ),
                SizedBox(height: 16),

                // ==================== ACARA 19 ====================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Acara19App()),
                    ),
                    child: Text('Buka Acara 19 (Route Generator)'),
                  ),
                ),
                SizedBox(height: 16),

                // ==================== ACARA 20 ====================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Acara20Screen()),
                    ),
                    child: Text('Buka Acara 20 (Drawer & Bottom Tab)'),
                  ),
                ),
                SizedBox(height: 16),

                // ==================== ACARA 21 ====================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Acara21Screen()),
                    ),
                    child: Text('Buka Acara 21 (Gradient)'),
                  ),
                ),
                SizedBox(height: 16),

                // ==================== ACARA 22 ====================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Acara22Screen()),
                    ),
                    child: Text('Buka Acara 22 (PageView with Images)'),
                  ),
                ),
                SizedBox(height: 16),

                // ==================== ACARA 23 ====================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Acara23Screen()),
                    ),
                    child: Text('Buka Acara 23 (PageView & Dropdown)'),
                  ),
                ),

                // ==================== ACARA 25-28 ====================
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BelajarForm()),
                    ),
                    child: Text('Buka Acara 25-28 (Semua Form)'),
                  ),
                ),

                // ==================== ACARA 29-32 (GetX) ====================
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Acara29Screen()),
                    ),
                    child: Text('Buka Acara 29-32 (GetX)'),
                  ),
                ),

                // ==================== ACARA 34 (REST API II) ====================
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => GetDataScreen()),
                    ),
                    child: Text('Buka Acara 34 (REST API II - Get Data)'),
                  ),
                ),

                // ==================== ACARA 35 & 36 (REST API III & IV) ====================
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // Memanggil class Acara35
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Acara35()),
                    ),
                    child: Text('Buka Acara 35 & 36 (MovieDB API)'),
                  ),
                ),

                // ==================== ACARA 37 & 38 (FIREBASE AUTH + API) ====================
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Acara37AuthScreen()),
                    ),
                    child: Text('Buka Acara 37 & 38 (Auth + API)'),
                  ),
                ),

                // ==================== ACARA 40 (MOVIEDB API) ====================
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreenMovieDB()),
                    ),
                    child: Text('Buka Acara 40 (MovieDB JSON API)'),
                  ),
                ),

                // ==================== ACARA 41-44 (CRUD FLUTTER) ====================
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MainCrudScreen()),
                    ),
                    child: Text('Buka Acara 41-44 (CRUD Data)'),
                  ),
                ),
                SizedBox(height: 32), // Spasi paling bawah agar rapi
              ],
            ),
          ),
        ),
      ),
    );
  }
}