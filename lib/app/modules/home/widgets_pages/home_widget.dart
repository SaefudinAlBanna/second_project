import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/app/modules/home/widgets_pages/nilai_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "Hai, ",
            style: TextStyle(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: "Muhammad",
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
                            colors: [Color(0xFFE52027), Color(0xFF831217)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "S.M. Husain. A",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Buka Husain",
                                      middleText:
                                          "Nanti akan diarahkan ke detailnya",
                                      textCancel: "Cancel",
                                      onCancel: () => Get.back(),
                                      textConfirm: "Okaaayy",
                                      onConfirm: () => Get.back(),
                                    );
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
                              "Kelas 3 A",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "SDTQ Telaga Ilmu Yogyakarta",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 7,
                  color: Colors.grey[400],
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Papan Pengumuman",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PapanPengumuman(
                              title: 'Nilai',
                              iconButton: IconButton(
                                onPressed: () {
                                  Get.to(NilaiWidget());
                                },
                                icon: Icon(Icons.home),
                                iconSize: 40,
                              ),
                            ),
                            PapanPengumuman(
                              title: 'Materi',
                              iconButton: IconButton(
                                onPressed: () {
                                  Get.to(NilaiWidget());
                                },
                                icon: Icon(Icons.system_security_update_good_outlined),
                                iconSize: 40,
                              ),
                            ),
                            PapanPengumuman(
                              title: 'Absensi',
                              iconButton: IconButton(
                                onPressed: () {
                                  Get.to(NilaiWidget());
                                },
                                icon: Icon(Icons.fingerprint_outlined),
                                iconSize: 40,
                              ),
                            ),
                            PapanPengumuman(
                              title: 'Ekskul',
                              iconButton: IconButton(
                                onPressed: () {
                                  Get.to(NilaiWidget());
                                },
                                icon: Icon(Icons.sports_handball_outlined),
                                iconSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Kumpulan PR",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Divider(color: Colors.black),
                      SizedBox(height: 10),
                      HomeWorkWidget(
                        title: "Bahasa Indonesia",
                        subtitle: "Halaman 5-10 / 3 hari yang lalu",
                      ),
                      // Divider(color: Colors.black),
                      HomeWorkWidget(
                        title: "Matematika",
                        subtitle: "Halaman 5-10 / 3 hari yang lalu",
                      ),
                      // Divider(color: Colors.black),
                      HomeWorkWidget(
                        title: "Bahasa Inggris",
                        subtitle: "Halaman 5-10 / 3 hari yang lalu",
                      ),
                      // Divider(color: Colors.black),
                      HomeWorkWidget(
                        title: "Bahasa Indonesia",
                        subtitle: "Halaman 5-10 / 3 hari yang lalu",
                      ),
                      // Divider(color: Colors.black),
                      HomeWorkWidget(
                        title: "Matematika",
                        subtitle: "Halaman 5-10 / 3 hari yang lalu",
                      ),
                      // Divider(color: Colors.black),
                      HomeWorkWidget(
                        title: "Bahasa Inggris",
                        subtitle: "Halaman 5-10 / 3 hari yang lalu",
                      ),
                      // Divider(color: Colors.black),
                      HomeWorkWidget(
                        title: "Bahasa Indonesia",
                        subtitle: "Halaman 5-10 / 3 hari yang lalu",
                      ),
                      // Divider(color: Colors.black),
                      HomeWorkWidget(
                        title: "Matematika",
                        subtitle: "Halaman 5-10 / 3 hari yang lalu",
                      ),
                      // Divider(color: Colors.black),
                      HomeWorkWidget(
                        title: "Bahasa Inggris",
                        subtitle: "Halaman 5-10 / 3 hari yang lalu",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PapanPengumuman extends StatelessWidget {
  const PapanPengumuman(
      {super.key, required this.title, required this.iconButton});

  final String title;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.grey[200],
      color: Colors.grey[200],
      borderOnForeground: false,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 75,
            margin: EdgeInsets.all(5),
            child: iconButton,
          ),
          Text(title),
        ],
      ),
    );
  }
}

class HomeWorkWidget extends StatelessWidget {
  const HomeWorkWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
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
