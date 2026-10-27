import 'package:flutter/material.dart';

class Acara21Screen extends StatefulWidget {
  @override
  _Acara21ScreenState createState() => _Acara21ScreenState();
}

class _Acara21ScreenState extends State<Acara21Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acara 21 - Gradient"),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Column(
        children: <Widget>[
          // Bagian 1: Linear Gradient (Perbandingan Flexible 1)
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo.shade200, Colors.indigo.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  "Linear Gradient",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Bagian 2: Radial Gradient (Perbandingan Flexible 2)
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.indigo.shade100, Colors.indigo.shade700],
                  radius: 0.8,
                ),
              ),
              child: Center(
                child: Text(
                  "Radial Gradient",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Bagian 3: Sweep Gradient (Perbandingan Flexible 1)
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: SweepGradient(
                  colors: [
                    Colors.indigo.shade300,
                    Colors.indigo.shade500,
                    Colors.indigo.shade800,
                    Colors.indigo.shade300,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  "Sweep Gradient",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}