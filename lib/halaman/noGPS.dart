import 'package:flutter/material.dart';

class noGPS extends StatefulWidget {
  State < noGPS > createState() => _noGPS();
}
class _noGPS extends State < noGPS > {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: < Widget > [
            Padding(padding: EdgeInsets.only(top: 20)),
            Text('Waktunya Absen', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text('Kamu belum berada pada jangkauan lokasi sekaloh.',
              style: TextStyle(fontSize: 18)),
            Padding(padding: EdgeInsets.only(top: 10)),
            Image.asset('assets/noLocation.png', scale: 1, ),
            Padding(padding: EdgeInsets.only(top: 10)),
          ],
        )
      ),
    );
  }

}