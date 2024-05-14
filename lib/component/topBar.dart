import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skandaonline/halaman/login.dart';

class topBar extends StatefulWidget {
  @override
  State<topBar> createState() => _topBar();
}

class _topBar extends State<topBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.account_circle, // Icon user
            color: Colors.indigo, // Warna ikon
            size: 60, // Ukuran ikon
          ),
          SizedBox(width: 10), // Spasi antara ikon dan teks
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Provider.of < UserProvider > (context, listen: false).getUser()!.nama,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                Provider.of < UserProvider > (context, listen: false).getUser()!.username,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
