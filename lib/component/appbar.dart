import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class myAppBar extends StatefulWidget {
  @override
  State<myAppBar> createState() => _myAppBar();
}

class _myAppBar extends State<myAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
