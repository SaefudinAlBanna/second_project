import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/widget_nilai_controller.dart';

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
              child: Row(
                children: [
                  Column(
                    spacing: 10,
                    children: [
                      Text('Nama Sisawa'),
                      Text('Nama Sisawa'),
                      Text('Nama Sisawa'),
                      Text('Nama Sisawa'),
                      Text('Nama Sisawa'),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    spacing: 10,
                    children: [
                      Text('Nama Sisawa'),
                      Text('Nama Sisawa'),
                      Text('Nama Sisawa'),
                      Text('Nama Sisawa'),
                      Text('Nama Sisawa'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(15),
                child: Obx(() => DataTable(
                    sortColumnIndex: sortIndex.value,
                    sortAscending: isAscending.value,
                    columns: [
                      DataColumn(
                        onSort: onSort,
                        label: Text('Nama'),
                        tooltip: 'tooltip',
                      ),
                      DataColumn(
                          onSort: onSort,
                          label: Text('Umur'),
                          tooltip: 'tooltip umur'),
                    ],
                    rows: people
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.name ?? '')),
                              DataCell(Text(e.age.toString())),
                            ]))
                        .toList()))),
          )),
        ]),
      ),
    );
  }
}
