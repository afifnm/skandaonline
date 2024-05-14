import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String? _currentAddress;
  Position? _currentPosition;
  final double targetLatitude = -7.590165; //ganti dengan titik lokasi sekolah
  final double targetLongitude = 110.9505183; //ganti dengan titik lokasi sekolah
  final double targetDistance = 50; // radius dari titik

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Fitur GPS belum diaktiftkan')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
      _checkDistance(position.latitude, position.longitude);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  void _checkDistance(double latitude, double longitude) {
    double distanceInMeters = Geolocator.distanceBetween(
      latitude,
      longitude,
      targetLatitude,
      targetLongitude,
    );

    if (distanceInMeters > targetDistance) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Kamu diluar jarak lokasi. Dengan jarak: $distanceInMeters meter'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Kamu berada pada tiit lokasi.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Page")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              Text('ADDRESS: ${_currentAddress ?? ""}'),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _getCurrentPosition,
                child: const Text("Cek Lokasi"),
              ),
              Visibility(
              visible: _currentPosition != null,
              child: _currentPosition != null
                  ? _checkDistanceWidget(_currentPosition!.latitude!,
                      _currentPosition!.longitude!)
                  : SizedBox(), // Placeholder widget if current position is null
            ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkDistanceWidget(double latitude, double longitude) {
  double distanceInMeters = Geolocator.distanceBetween(
    latitude,
    longitude,
    targetLatitude,
    targetLongitude,
  );

  if (distanceInMeters > targetDistance) {
    return Text(
      'Kamu diluar jarak lokasi. Dengan jarak: $distanceInMeters meter',
    );
  } else {
    return Text(
      'Kamu berada dalam titik lokasi',
    );
  }
}
}
