import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage2> {
  final TextEditingController _nisController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String nis = _nisController.text;
    final String password = _passwordController.text;

    final response = await http.post(
      Uri.parse('https://presensi.pipapip.web.id/api/login'),
      body: {
        'username': nis,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Login berhasil, lakukan sesuatu seperti navigasi ke halaman berikutnya
      final responseData = json.decode(response.body);
      // Misalnya, print pesan dari respons API
      print(responseData['message']);
      print(responseData['status']);
    } else {
      // Login gagal, tampilkan pesan kesalahan
      final responseData = json.decode(response.body);
      // Misalnya, tampilkan pesan kesalahan dalam dialog
      print(responseData['message']);
      print(responseData['status']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nisController,
              decoration: InputDecoration(
                labelText: 'NIS',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage2(),
  ));
}
