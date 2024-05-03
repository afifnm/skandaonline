import 'package:flutter/material.dart';

class navSidebar extends StatefulWidget {
  State < navSidebar > createState() => _navSidebar();
}
class _navSidebar extends State < navSidebar > {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: < Widget > [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: < Widget > [
                  Text(
                    'SMKN 2 KARANGANYAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Beranda'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            ListTile(
              title: Text('Izin'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/izin');
              },
            ),
            ListTile(
              title: Text('Pelanggaran'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pelanggaran');
              },
            ),
            ListTile(
              title: Text('Prestasi'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/prestasi');
              },
            ),
          ],
        ),
      );
  }
}