import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/widget_nilai_controller.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/rendering.dart';

class NilaiWidget extends StatelessWidget {
  const NilaiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nilai",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Buka Muhammad",
                middleText: "nanti akan di arahkan ke detailnya",
                textCancel: "Cancel",
                onCancel: () => Get.back(),
                textConfirm: "Okaaayy",
                onConfirm: () => Get.back(),
              );
            },
            icon: Icon(
              Icons.menu_book_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            color: Colors.grey[300],
            margin: EdgeInsets.all(15),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text('Nama Satuan Pendidikan'),
                        Text('Alamat '),
                        Text('Nama Peserta Didik'),
                        Text('Nomor Induk / NISN'),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text('PKBM STQ TELAGA ILMU'),
                        Text('Sawo, Banguntapan Bantul Yogyakarta'),
                        Text('Sayyid M Husain A'),
                        Text('428 / 123XXXX'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Obx(() => DataTable(
                      sortColumnIndex: sortIndex.value,
                      sortAscending: isAscending.value,
                      columnSpacing: 30,
                      horizontalMargin: 30,
                      columns: [
                        DataColumn(
                          onSort: onSort,
                          label: Text(
                            'Mata Pelajaran',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          tooltip: 'tooltip',
                        ),
                        DataColumn(
                            onSort: onSort,
                            label: Text(
                              'SKK',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            numeric: true,
                            tooltip: 'tooltip skk'),
                        DataColumn(
                          numeric: true,
                          label: Text(
                            'KKM',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          numeric: true,
                          label: Text(
                            'Nilai (Modul 1)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        DataColumn(
                          numeric: true,
                          label: Text(
                            'Nilai (Modul 2)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          numeric: true,
                          label: Text(
                            'Nilai (Modul 3)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Predikat (Modul 1)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Predikat (Modul 2)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Predikat (Modul 3)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      rows: people
                          .map(
                            (e) => DataRow(cells: [
                              DataCell(Text(e.mapel ?? '')),
                              DataCell(Text(e.skk.toString())),
                              DataCell(Text(e.kkm.toString())),
                              DataCell(Text(e.nilaiModul1.toString())),
                              DataCell(Text(e.nilaiModul2.toString())),
                              DataCell(Text(e.nilaiModul3.toString())),
                              DataCell(Text(e.predikatModul1 ?? '')),
                              DataCell(Text(e.predikatModul2 ?? '')),
                              DataCell(Text(e.predikatModul3 ?? '')),
                            ]
                            
                            ),
                          )
                          .toList()))),
            ),
          )),
        ]),
      ),
    );
  }
}
