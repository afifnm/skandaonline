import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'
as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skandaonline/halaman/login.dart';

class absen extends StatefulWidget {
  State < absen > createState() => _absen();
}
class _absen extends State < absen > {
  Future<void> _doAbsen2() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Handle the captured image, you may want to process it further or upload it
    print(pickedFile.path);// Jalankan _doAbsen setelah foto diambil
    await _doAbsen();
    }
  }
  Future < void > _doAbsen() async {
    final String nis = Provider.of < UserProvider > (context, listen: false).getUser()!.username;
    final response = await http.post(
      Uri.parse('https://presensi.pipapip.web.id/api'),
      body: {
        'username': nis
      },
    );
    print(json.decode(response.body));
    final pesan = json.decode(response.body);
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informasi'),
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
  Future < void > _doPulang() async {
    final String nis = Provider.of < UserProvider > (context, listen: false).getUser()!.username;
    final response = await http.put(
      Uri.parse('https://presensi.pipapip.web.id/api'),
      body: {
        'username': nis
      },
    );
    print(json.decode(response.body));
    final pesan = json.decode(response.body);
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informasi'),
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
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    Widget childWidget;
    // Pengecekan waktu untuk menentukan childWidget
    if (now.hour < 8) {
      childWidget = masuk();
    } else if ((now.hour < 20) && (now.hour > 15)) {
      childWidget = pulang();
    } else {
      childWidget = jamsekolah();
    }
    return Container(
      padding: EdgeInsets.all(13),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: childWidget,
    );
  }

  Center masuk() {
    return Center(
      child: Column(
        children: < Widget > [
          Padding(padding: EdgeInsets.only(top: 20)),
          Text('Waktunya Absen', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Silahkan absen dan nikmati waktu di sekolahmu.',
            style: TextStyle(fontSize: 20)),
          Padding(padding: EdgeInsets.only(top: 10)),
          Image.asset('assets/yesGPS.png', scale: 1, ),
          Padding(padding: EdgeInsets.only(top: 10)),
          ElevatedButton(
            onPressed: _doAbsen2,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigo, // Warna teks tombol
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius tombol
              ),
              minimumSize: Size(400, 50), // Lebar dan tinggi tombol
            ),
            child: Text('AKU HADIR', style: TextStyle(fontSize: 20), ), // Teks pada tombol
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
        ],
      )
    );
  }
  Center pulang() {
    return Center(
      child: Column(
        children: < Widget > [
          Padding(padding: EdgeInsets.only(top: 20)),
          Text('Waktunya Pulang', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Silahkan absen pulang dan selamat beristirahat.',
            style: TextStyle(fontSize: 20)),
          Padding(padding: EdgeInsets.only(top: 10)),
          Image.asset('assets/yesGPS.png', scale: 1, ),
          Padding(padding: EdgeInsets.only(top: 10)),
          ElevatedButton(
            onPressed: _doPulang,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigo, // Warna teks tombol
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius tombol
              ),
              minimumSize: Size(400, 50), // Lebar dan tinggi tombol
            ),
            child: Text('PULANG', style: TextStyle(fontSize: 20), ), // Teks pada tombol
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
        ],
      )
    );
  }
   Center jamsekolah() {
    return Center(
      child: Column(
        children: < Widget > [
          Padding(padding: EdgeInsets.only(top: 20)),
          Text('Hi, semangat belajarnya.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('belum waktunya pulang nih.',
            style: TextStyle(fontSize: 20)),
          Padding(padding: EdgeInsets.only(top: 10)),
          Image.asset('assets/yesGPS.png', scale: 1, ),
          Padding(padding: EdgeInsets.only(top: 20)),
        ],
      )
    );
  }
}