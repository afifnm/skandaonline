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
            Padding(padding: EdgeInsets.only(top: 30)),
            Text('Aktivitas', style: TextStyle(fontSize: 18), ),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text('GPS Belum Aktif', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text('Hidupkan GPS pada setting hp atau setting browser untuk melanjutkan.',
              style: TextStyle(fontSize: 20)),
            Padding(padding: EdgeInsets.only(top: 30)),
            Image.asset('assets/unknown.png', scale: 3, ),
            Padding(padding: EdgeInsets.only(top: 80)),
          ],
        )
      ),
    );
  }

}