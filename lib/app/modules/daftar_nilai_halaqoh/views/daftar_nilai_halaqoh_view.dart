import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:second_project/app/routes/app_pages.dart';

import '../controllers/daftar_nilai_halaqoh_controller.dart';

class DaftarNilaiHalaqohView extends GetView<DaftarNilaiHalaqohController> {
  DaftarNilaiHalaqohView({super.key});

  final dataxx = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Nilai Halaqoh'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Column(
              children: [
                Center(
                    child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://ui-avatars.com/api/?name=${dataxx['namasiswa']}"),
                        fit: BoxFit.cover),
                  ),
                )),
                Text(dataxx['namasiswa']),
              ],
            ),
            SizedBox(height: 20),
            // ElevatedButton(onPressed: (){
            //   controller.Test();
            // }, child: Text('test')),
            Expanded(
                child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    future: controller.getDataNilai(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.data!.docs.isEmpty ||
                          snapshot.data == null) {
                        return Center(child: Text('Belum ada data nilai'));
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs[index].data();
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_NILAI_HALAQOH,
                                    arguments: data);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: 15, left: 10, right: 10),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Halaqohnya'),
                                        // Text(DateFormat('dd/MM/yyyy').format(DateTime.now()))
                                        // Text(DateFormat('EEEE, dd MMMM, yyyy - HH:mm').format(DateTime.now()))
                                        Text(
                                          DateFormat('EEEE, dd MMMM, yyyy')
                                              .format(DateTime.parse(
                                                  data['tanggalinput'])),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Divider(
                                      height: 2,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                        'Hafalan Surat : ${data['hafalansurat']}'),
                                    SizedBox(height: 7),
                                    Text(
                                        'UMMI Jld/ Surat : ${data['ummijilidatausurat']}'),
                                    // SizedBox(height: 7),
                                    // Text('Materi : ${data['materi']}'),
                                    // SizedBox(height: 7),
                                    // Text('Nilai : ${data['nilai']}'),
                                    // SizedBox(height: 15),
                                    // Text(
                                    //   'Catatan',
                                    //   style: TextStyle(
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    // Divider(),
                                    // // SizedBox(height: 3),
                                    // Text(
                                    //     'pengampu : ${data['keteranganpengampu']}'),
                                    // SizedBox(height: 7),
                                    // // Text('orangtua : ${data['keteranganorangtua']}'),
                                    // Text(
                                    //     // ignore: unrelated_type_equality_checks
                                    //     "orangtua : ${data == 0 ? (data['keteranganorangtua'] ?? '-') : '-'}"),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: Text('No data available'));
                      }
                    })),
          ],
        )));
  }
}
