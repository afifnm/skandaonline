import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skandaonline/component/navBottom.dart';
import 'package:skandaonline/component/topBar.dart';
import 'package:intl/intl.dart'; 
import 'package:http/http.dart' as http;

class IzinPage extends StatefulWidget {
  const IzinPage({super.key});

  @override
  State < IzinPage > createState() => _IzinPage();
}
Future fetchDataFromAPI() async {
  List < dynamic > apiIzin = [];

  dynamic finalProducts = {
    "izin": [],
  };

  await http.get(Uri.parse("https://presensi.pipapip.web.id/api?username=8096"))
    .then((value) {
      dynamic apiResponse = json.decode(value.body.toString());
      List < dynamic > products = apiResponse['izin'];
      for (var row in products) {
        apiIzin.add({
          "keterangan": row["keterangan"],
          "alasan": row["alasan"],
          "tanggal": row["tanggal"],
        });
      }
      finalProducts['izin'] = apiIzin;
    });
  return finalProducts;
}

class _IzinPage extends State < IzinPage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo, // Warna latar belakang putih
        centerTitle: true,
        title: Text(
          'E-MLEBU',
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
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40, bottom: 40, right: 30, left: 30),
          child: Column(
            children: < Widget > [
              topBar(),
              Padding(padding: EdgeInsets.only(top: 40)),
              Container(
                padding: EdgeInsets.all(13),
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: < Widget > [
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text('Izin Siswa', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      FutureBuilder(
                        future: fetchDataFromAPI(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (snapshot.hasData) { // Periksa apakah data tersedia
                            List < dynamic > data = snapshot.data['izin'] as List < dynamic > ;
                            return Column(
                              children: [
                                DataTable(
                                  columnSpacing: 5,
                                  columns: [
                                    DataColumn(label: Text('Ket')),
                                    DataColumn(label: Text('Alasan')),
                                    DataColumn(label: Text('Tanggal')),
                                  ],
                                  rows: data.map((item) => DataRow(
                                    cells: [
                                      DataCell(Text(item['keterangan'])),
                                      DataCell(Text(item['alasan'])),
                                       DataCell(Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(item['tanggal'])))),
                                    ],
                                  )).toList(),
                                ),

                              ],
                            );
                          } else {
                            return Center(child: Text('Tidak ada data tersedia'));
                          }
                        },
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: navBottom(),
    );
  }
}