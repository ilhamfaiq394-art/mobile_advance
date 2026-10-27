import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Acara15Screen(),
    );
  }
}

class Acara15Screen extends StatefulWidget {
  @override
  _Acara15ScreenState createState() => _Acara15ScreenState();
}

class _Acara15ScreenState extends State<Acara15Screen> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code Acara 15'),
      ),
      backgroundColor: Colors.blueGrey.shade200,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Text Widget dengan Style
            Text(
              'Ini Text',
              style: TextStyle(
                color: Colors.blue,
                backgroundColor: Colors.pink,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // 2. Container Widget
            Container(
              padding: EdgeInsets.all(32.0),
              margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.purple,
              ),
              child: Text(
                'Haiii',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            SizedBox(height: 16),

            // 3. Icon Widget di dalam Row & Column
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_alarm),
                      Text('Alarm'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.phone),
                      Text('Phone'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.book),
                      Text('Book'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // 4. Button Widgets (Diperbarui untuk Flutter Modern)
            Column(
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: Text("Elevated Button"),
                  onPressed: () {},
                ),
                MaterialButton(
                  color: Colors.lime,
                  child: Text("Material Button"),
                  onPressed: () {},
                ),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.green),
                  child: Text("Text Button"),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),

            // 5. TextFormField Widget di dalam Form
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(hintText: "Username"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Text("Login"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}