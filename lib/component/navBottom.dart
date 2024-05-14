import 'package:flutter/material.dart';

class navBottom extends StatefulWidget {
  @override
  State < navBottom > createState() => _navBottom();
}

class _navBottom extends State < navBottom > {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.indigo,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: < Widget > [
          _buildNavItem(Icons.home, 'Dashboard', '/dashboard'),
          _buildNavItem(Icons.security, 'Izin', '/izin'),
          _buildNavItem(Icons.warning, 'Pelanggaran', '/pelanggaran'),
          _buildNavItem(Icons.emoji_events, 'Prestasi', '/prestasi'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}