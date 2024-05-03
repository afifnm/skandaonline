import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class navBottom extends StatefulWidget {
  @override
  State < navBottom > createState() => _navBottom();
}
class _navBottom extends State < navBottom > {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: < Widget > [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.security),
            onPressed: () {
              // Action when "Izin" is pressed
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.warning),
            onPressed: () {
              // Action when "Pelanggaran" is pressed
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.emoji_events),
            onPressed: () {
              // Action when "Prestasi" is pressed
            },
          ),
        ],
      ),
    );
  }

}