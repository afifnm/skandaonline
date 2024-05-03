import 'package:flutter/material.dart';

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
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.security),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/izin');
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.warning),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/pelanggaran');
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.emoji_events),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/prestasi');
            },
          ),
        ],
      ),
    );
  }

}