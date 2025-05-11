import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeWidget extends GetView<HomeController> {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.userStreamBaru(),
        builder: (context, snapsiswa) {
          if (snapsiswa.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapsiswa.data!.data() == null || snapsiswa.data == null) {
            return Center(
                child: Column(
              children: [
                Text('Data tidak ditemukan'),
                Text('Silahkan Logout terlebih dahulu, kemudian Login ulang'),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.HOME);
                      Get.snackbar('Login', 'Silahkan login ulang');
                    },
                    child: Text('Logout')),
              ],
            ));
            // return
          } else if (snapsiswa.hasData) {
            Map<String, dynamic> datasiswa = snapsiswa.data!.data()!;

            return Scaffold(
              appBar: AppBar(
                title: RichText(
                  text: TextSpan(
                    text: "Assalamu'alaykum,  ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        // text: "Muhammad",
                        text: datasiswa['nama'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.red,
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                          onCancel: Get.back,
                          title: 'Fitur',
                          middleText: 'Fitur dalam pengembangan');
                    },
                    icon: Icon(
                      Icons.menu_book_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  ClipPath(
                    clipper: ClassClipPathTop(), // ini nanti di aktifkan lagi
                    child: Container(
                      height: 250,
                      width: Get.width,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ClipPath(
                              clipper: ClipPathClass(),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                height: 200,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFE52027),
                                      Color(0xFF831217)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: FutureBuilder<
                                        DocumentSnapshot<Map<String, dynamic>>>(
                                    future: controller.getDataDocKelasSiswa(),
                                    builder: (context, snapshotDataKelas) {
                                      if (snapshotDataKelas.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      if (snapshotDataKelas.hasData) {
                                        Map<String, dynamic>? dataKelas =
                                            snapshotDataKelas.data!.data();
                                        // print('isi dataKelas = $dataKelas');
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  datasiswa['nama'],
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                        onCancel: Get.back,
                                                        title: 'Fitur',
                                                        middleText:
                                                            'Fitur dalam pengembangan');
                                                  },
                                                  icon: Icon(
                                                    Icons.person,
                                                    color: Colors.grey[400],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Text(
                                              "SD IT Ukhuwah Islamiyah",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Kelas : ${dataKelas?['namakelas'] ?? 'N/A'}  NISN : ${dataKelas?['nisn'] ?? 'N/A'}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    }),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(height: 7, color: Colors.grey[400]),

                        SizedBox(height: 20),
                        Text("Informasi", style: TextStyle(fontSize: 20)),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MenuAtas(
                                title: 'Halaqoh',
                                icon: Icon(Icons.menu_book_sharp),
                                onTap: () {
                                  // Get.toNamed(Routes.DAFTAR_NILAI_HALAQOH);
                                  Get.defaultDialog(
                                      onCancel: Get.back,
                                      title: 'Halaqoh',
                                      middleText: 'Fitur dalam pengembangan');
                                },
                              ),
                              MenuAtas(
                                title: 'Kelas',
                                icon: Icon(Icons.school_outlined),
                                onTap: () => Get.defaultDialog(
                                    onCancel: Get.back,
                                    title: 'Kelas',
                                    middleText: 'Fitur dalam pengembangan'),
                              ),
                              MenuAtas(
                                title: 'Ekskul',
                                icon: Icon(Icons.sports_gymnastics_rounded),
                                onTap: () => Get.defaultDialog(
                                    onCancel: Get.back,
                                    title: 'Ekskul',
                                    middleText: 'Fitur dalam pengembangan'),
                              ),
                              MenuAtas(
                                title: 'Sekolah',
                                icon: Icon(Icons.info_outline),
                                onTap: () => Get.defaultDialog(
                                    onCancel: Get.back,
                                    title: 'Sekolah',
                                    middleText: 'Fitur dalam pengembangan'),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nilai Halaqoh",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    controller.keDaftarNilai();
                                  },
                                  child: Text('selengkapnya'))
                            ],
                          ),
                        ),
                        // Divider(color: Colors.black),
                        // Divider(),
                        Container(
                          height: 2,
                          color: Colors.grey[300],
                        ),

                        Expanded(
                            child: FutureBuilder<
                                    QuerySnapshot<Map<String, dynamic>>>(
                                future: controller.getDataNilai(),
                                builder: (context, snapshotNilaiHalaqoh) {
                                  if (snapshotNilaiHalaqoh.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (snapshotNilaiHalaqoh.data!.docs.isEmpty ||
                                      snapshotNilaiHalaqoh.data == null) {
                                    return Center(
                                        child: Text('Belum ada data nilai'));
                                  }
                                  if (snapshotNilaiHalaqoh.hasData) {
                                    return ListView.builder(
                                      itemCount: snapshotNilaiHalaqoh
                                          .data!.docs.length,
                                      itemBuilder: (context, index) {
                                        final data = snapshotNilaiHalaqoh
                                            .data!.docs[index]
                                            .data();
                                        // print('data = $data');
                                        return GestureDetector(
                                          onTap: () {
                                            // DateTime now = DateTime.now();
                                            // String formattedDate =
                                            //     '${now.day}/${now.month}/${now.year}';
                                            // Get.snackbar('title',
                                            //     'message $formattedDate');
                                            Get.toNamed(
                                                Routes.DETAIL_NILAI_HALAQOH,
                                                arguments: data);
                                            // print('argumenDataLemparHome = $data');
                                          },
                                          child: Card(
                                            margin: EdgeInsets.only(
                                                bottom: 15,
                                                left: 10,
                                                right: 10),
                                            color: Colors.grey[350],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Halaqohnya'),
                                                      // Text(DateFormat('dd/MM/yyyy').format(DateTime.now()))
                                                      // Text(DateFormat('EEEE, dd MMMM, yyyy - HH:mm').format(DateTime.now()))
                                                      Text(
                                                        DateFormat(
                                                                'EEEE, dd MMMM, yyyy')
                                                            .format(DateTime
                                                                .parse(data[
                                                                    'tanggalinput'])),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                      'Hafalan Surat : ${data['hafalansurat']}'),
                                                  Text(
                                                      'UMMI Jld/ Surat : ${data['ummijilidatausurat']}'),
                                                  // Text('Materi : ${data['materi']}'),
                                                  // Text('Nilai : ${data['nilai']}'),
                                                  // Text('Catatan',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),

                                                  // Text('pengampu : ${data['keteranganpengampu']}'),
                                                  // Text("orangtua : ${data == 0 ? (data['keteranganorangtua'] ?? '-') : '-'}"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Center(
                                        child: Text('No data available'));
                                  }
                                })),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Terjadi kesalahan, cek koneksi internet'),
            );
          }
        });
  }
}

//========================================================================
class MenuAtas extends StatelessWidget {
  const MenuAtas({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Icon icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.indigo.shade500,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Icon(
                icon.icon,
                size: 40,
                color: Colors.white,
              )),
            ),
          ),
          SizedBox(height: 3),
          SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 12),
              ))
        ],
      ),
    );
  }
}
//========================================================================

class HomeWorkWidget extends StatelessWidget {
  const HomeWorkWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tanggal,
  });

  final String title;
  final String subtitle;
  final String tanggal;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: ListTile(
        title: Text(title),
        subtitle: Row(
          children: [Text(subtitle), Text(tanggal)],
        ),
        trailing: TextButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Buka Tugas",
              middleText: "Anda akan mengerjakan tugasnya",
              textCancel: "Cancel",
              onCancel: () => Get.back(),
              textConfirm: "Okaaayy",
              onConfirm: () => Get.back(),
            );
          },
          child: Text("Selengkapnya"),
        ),
        // leading: Checkbox(
        //   value: true,
        //   onChanged: (value) => true,
        // ),
      ),
    );
  }
}

class IsiHomeWork extends StatelessWidget {
  const IsiHomeWork({
    super.key,
    required this.isitext,
  });

  final String isitext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(isitext),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 50, size.height);
    path.lineTo(size.width, size.height - 50);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class ClassClipPathTop extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
