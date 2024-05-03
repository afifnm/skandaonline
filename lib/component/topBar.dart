import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class topBar extends StatefulWidget {
  @override
  State < topBar > createState() => _topBar();
}
class _topBar extends State < topBar > {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Afif Nuruddin Maisaroh',
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'NIS: 3676',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}