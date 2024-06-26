import 'package:flutter/material.dart';
import 'package:skandaonline/component/appbar.dart';
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
  final double targetDistance = 70; // 50 meters

  bool isOutsideTargetDistance = false;
  String currentLocation = '';
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
        currentLocation = 'Latitude: ${currentPosition.latitude}, Longitude: ${currentPosition.longitude}';
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
      )
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
                    SizedBox(height: 20), // Spasi antara widget absen dan informasi lokasi
                    Text(
                      '$currentLocation', // Menampilkan informasi lokasi saat ini
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
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
