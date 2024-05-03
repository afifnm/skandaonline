import 'package:flutter/material.dart';
import 'package:skandaonline/halaman/dashboard.dart';
import 'package:skandaonline/halaman/izin.dart';
import 'package:skandaonline/halaman/login.dart';
import 'package:skandaonline/halaman/pelanggaran.dart';
import 'package:skandaonline/halaman/prestasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/izin': (context) => IzinPage(),
        '/prestasi': (context) => PrestasiPage(),
        '/pelanggaran': (context) => PelanggaranPage(),
      },
      title: 'SkandaKra Online',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}