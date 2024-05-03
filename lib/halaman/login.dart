import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'
as http;

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key
  });
  @override
  State < LoginPage > createState() => _LoginPage();
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
      Navigator.pushReplacementNamed(context, '/dashboard');
      print(json.decode(response.body));
    } else {
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
                Text('E-MLEBU', style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: Colors.blue.shade400,
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
                    backgroundColor: Colors.blue, // Warna teks tombol
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