import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State < DashboardPage > createState() => _Dashboard();
}
class _Dashboard extends State < DashboardPage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Warna latar belakang putih
        centerTitle: true,
        title: Text(
          'E-MLEBU',
          style: TextStyle(
            color: Color(0xFF2F27CE), // Warna teks #2F27CE
            fontFamily: 'Roboto', // Font family Roboto
            fontSize: 25,
            fontWeight: FontWeight.w700
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black), // Ikonya disini (misalnya, ikon menu)
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Ketika ikon ditekan, buka sidebar
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        // Widget Sidebar / Drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: < Widget > [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'E-MLEBU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Izin'),
              onTap: () {
                // Aksi ketika menu 1 dipilih
              },
            ),
            ListTile(
              title: Text('Pelanggaran'),
              onTap: () {
                // Aksi ketika menu 2 dipilih
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: < Widget > [
                Text('Selamat datang di aplikasi presensi Online'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}