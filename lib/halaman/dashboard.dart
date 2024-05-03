import 'package:flutter/material.dart';
import 'package:skandaonline/component/navBottom.dart';
import 'package:skandaonline/component/navSidebar.dart';
import 'package:skandaonline/component/topBar.dart';
import 'package:skandaonline/halaman/noGps.dart';

class DashboardPage extends StatefulWidget {
  @override
  State < DashboardPage > createState() => _Dashboard();
}
class _Dashboard extends State < DashboardPage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300, 
        centerTitle: true,
        title: Text('E-MLEBU',
            style: TextStyle(
            color: Colors.white, // Warna teks #2F27CE
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
      drawer: navSidebar(),
      body: Container(
        color: Colors.blue.shade50,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 60, bottom: 40, right: 30, left: 30),
          child: Column(
            children: < Widget > [
              topBar(),
              Padding(padding: EdgeInsets.only(top: 40)),
              noGPS(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBottom(),
    );
  }
}