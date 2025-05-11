import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/detail_nilai_halaqoh_controller.dart';

class DetailNilaiHalaqohView extends GetView<DetailNilaiHalaqohController> {
  DetailNilaiHalaqohView({super.key});
  final argumenData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // print('argumenDataDetail = $argumenData');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Nilai Halaqoh'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Halaqohnya'),
                  // Text(DateFormat('dd/MM/yyyy').format(DateTime.now()))
                  // Text(DateFormat('EEEE, dd MMMM, yyyy - HH:mm').format(DateTime.now()))
                  Text(
                    DateFormat('EEEE, dd MMMM, yyyy')
                        .format(DateTime.parse(argumenData['tanggalinput'])),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Divider(
                height: 2,
                color: Colors.black,
              ),
              SizedBox(height: 7),
              Text('Hafalan Surat : ${argumenData['hafalansurat']}'),
              SizedBox(height: 7),
              Text('UMMI Jld/ Surat : ${argumenData['ummijilidatausurat']}'),
              SizedBox(height: 7),
              Text('Materi : ${argumenData['materi']}'),
              SizedBox(height: 7),
              Text('Nilai : ${argumenData['nilai']}'),
              SizedBox(height: 15),
              Text(
                'Catatan',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Divider(),
              // SizedBox(height: 3),
              Text('pengampu : ${argumenData['keteranganpengampu']}'),
              SizedBox(height: 15),
              // Text('orangtua : ${argumenData['keteranganorangtua']}'),
             if (argumenData['keteranganorangtua'] != "0")
               Text('orangtua : ${argumenData['keteranganorangtua']}') 
             else 
               Row(
                 children: [
                   Expanded(
                     child: TextField(
                       controller: controller.keteranganOrangTuaC,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         hintText: 'Catatan OrangTua',
                       ),
                     ),
                   ),
                   SizedBox(
                       width:
                           10), // Add spacing between the TextField and Button
                   ElevatedButton(
                     onPressed: () {
                       if (controller.keteranganOrangTuaC.text == "" || controller.keteranganOrangTuaC.text.isEmpty) {
                         Get.snackbar("Error", "Catatan orangtua masih kosong");
                       } else {
                         controller.simpan();
                        //  controller.test();
                       }
                     },
                     child: Text("Simpan"),
                   ),
                 ],
               )
            ],
          ),
        ),
      ),
      // body: Center(
      // child: Container(

      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         'nama : ${argumenData['namasiswa']}',
      //         style: TextStyle(fontSize: 20),
      //       ),
      //       SizedBox(height: 15),
      //       Text(
      //         DateFormat('EEEE, dd MMMM, yyyy')
      //             .format(DateTime.parse(argumenData['tanggalinput'])),
      //       ),
      //     ],
      //   ),
      // ),
      // ),
    );
  }
}
