import 'package:flutter/material.dart';

class Acara17 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.dashboard),
        title: Text("Acara 17 - Flutter Styling"),
        actions: <Widget>[
          Icon(Icons.search),
        ],
        actionsIconTheme: IconThemeData(color: Colors.brown.shade200),
        backgroundColor: Colors.brown.shade400,
        bottom: PreferredSize(
          child: Container(
            color: Colors.brown.shade700,
            height: 4.0,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade400,
        child: Text('+'),
        onPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.brown.shade300,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.brown.shade500,
                shape: BoxShape.circle,
              ),
            ),
            Row(
              // Bagian 3: Row dengan tiga Container berbentuk lingkaran di akhir kolom
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(4.0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade200,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(4.0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade400,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(4.0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade600,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}