import 'package:flutter/material.dart';
import 'package:skandaonline/halaman/cek_lokasi.dart';
import 'package:skandaonline/halaman/dashboard.dart';
import 'package:skandaonline/halaman/izin.dart';
import 'package:skandaonline/halaman/login.dart';
import 'package:skandaonline/halaman/pelanggaran.dart';
import 'package:skandaonline/halaman/prestasi.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key
  });

  // Fungsi untuk membuat halaman tanpa transisi
  Route<dynamic> buildNoTransitionRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider()), ],
      child: MaterialApp(
        initialRoute: '/dashboard',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return buildNoTransitionRoute(const LoginPage());
            case '/dashboard':
              return buildNoTransitionRoute(DashboardPage());
            case '/izin':
              return buildNoTransitionRoute(IzinPage());
            case '/prestasi':
              return buildNoTransitionRoute(PrestasiPage());
            case '/pelanggaran':
              return buildNoTransitionRoute(PelanggaranPage());
            default:
              return null;
          }
        },
        title: 'Intern Seeker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
