import 'package:flutter/material.dart';

class GetDetailScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  const GetDetailScreen({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(userData['avatar']),
              ),
              SizedBox(height: 16),
              Text(
                "${userData['first_name']} ${userData['last_name']}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                userData['email'],
                style: TextStyle(fontSize: 16, color: Colors.grey[650]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}