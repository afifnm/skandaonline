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
              title: Text('Izin'),
              onTap: () {
                // Add your onTap logic here
              },
            ),
            ListTile(
              title: Text('Pelanggaran'),
              onTap: () {
                // Add your onTap logic here
              },
            ),
            ListTile(
              title: Text('Prestasi'),
              onTap: () {
                // Add your onTap logic here
              },
            ),
          ],
        ),
      );
  }
}