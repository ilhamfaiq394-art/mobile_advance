import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'get_detail_screen.dart';

class GetDataScreen extends StatefulWidget {
  @override
  _GetDataScreenState createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  List<dynamic> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  // Fungsi untuk mengambil data dari REST API secara asynchronous
  Future<void> _fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _users = data['data'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API II - Get Data"),
        backgroundColor: Colors.blue,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(_users[index]['avatar']),
                  ),
                  title: Text(
                    "${_users[index]['first_name']} ${_users[index]['last_name']}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_users[index]['email']),
                  onTap: () {
                    // Navigasi ke Halaman Detail saat item ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetDetailScreen(userData: _users[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}