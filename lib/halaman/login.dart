import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'
as http;
import 'package:provider/provider.dart';

// Buat model untuk data pengguna setelah login
class UserData {
  final String username;
  final String nama;
  final String kelas;
  final String email;
  final String role;

  UserData({
    required this.username,
    required this.nama,
    required this.kelas,
    required this.email,
    required this.role,
  });
}


class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key
  });
  @override
  State < LoginPage > createState() => _LoginPage();
}
// Buat provider untuk menyimpan informasi pengguna setelah login
class UserProvider extends ChangeNotifier {
  UserData ? _userData;

  UserData ? get userData => _userData;

  // Fungsi untuk menyimpan informasi pengguna setelah login
  void setUserData({
    required String username,
    required String nama,
    required String kelas,
    required String email,
    required String role,
  }) {
    _userData = UserData(
      username: username,
      nama: nama,
      kelas: kelas,
      email: email,
      role: role
    );
    notifyListeners();
  }
  UserData? getUser(){
    return _userData;
  }
}

class _LoginPage extends State < LoginPage > {
  
  final TextEditingController _nisController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future < void > _login() async {
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
      final data = json.decode(response.body);
          // Set informasi pengguna setelah login ke dalam provider
      Provider.of < UserProvider > (context, listen: false).setUserData(
        username: data['user']['username'],
        nama: data['user']['nama'],
        kelas: data['user']['kelas'],
        email: data['user']['email'],
        role: data['user']['level']
      );
      print(json.decode(response.body));
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      print(json.decode(response.body));
      final pesan = json.decode(response.body);
       showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Peringatan'),
            content: Text(pesan['message']),
            actions: < Widget > [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tutup'),
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(Object context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 15, right: 40, left: 40),
            child: Column(
              children: < Widget > [
                Padding(padding: EdgeInsets.only(bottom: 80)),
                Image.asset('assets/logo.png', scale: 2, ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text('SKANDA ONLINE', style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: Colors.indigo,
                ), ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                TextFormField(
                  controller: _nisController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'NIS',
                    labelStyle: TextStyle(
                      fontSize: 20
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                      fontSize: 20
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 50)),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo, // Warna teks tombol
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // Border radius tombol
                    ),
                    minimumSize: Size(400, 50), // Lebar dan tinggi tombol
                  ),
                  child: Text('Sign In', style: TextStyle(fontSize: 20), ), // Teks pada tombol
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}