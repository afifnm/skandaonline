import 'package:flutter/material.dart';
import 'package:skandaonline/component/navBottom.dart';
import 'package:skandaonline/component/topBar.dart';
import 'package:skandaonline/halaman/absen.dart';
import 'package:skandaonline/halaman/noGps.dart';
import 'package:geolocator/geolocator.dart';

class DashboardPage extends StatefulWidget {
  @override
  State < DashboardPage > createState() => _Dashboard();
}

class _Dashboard extends State < DashboardPage > {
  final double targetLatitude = -7.590165;
  final double targetLongitude = 110.9505183;
  final double targetDistance = 50; // 50 meters

  bool isOutsideTargetDistance = false;

  @override
  void initState() {
    super.initState();
    _checkDistance();
  }

  Future<void> _checkDistance() async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double distanceInMeters = Geolocator.distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        targetLatitude,
        targetLongitude,
      );

      setState(() {
        isOutsideTargetDistance = distanceInMeters > targetDistance;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text('SKANDA ONLINE',
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey.shade200, // Warna latar belakang
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 40, bottom: 40, right: 30, left: 30),
                child: Column(
                  children: <Widget>[
                    topBar(),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    isOutsideTargetDistance ? noGPS() : absen(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: navBottom(),
    );
  }
}
