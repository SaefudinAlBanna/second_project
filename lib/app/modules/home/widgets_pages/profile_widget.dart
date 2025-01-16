import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
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
      body: Stack(
        children: [
          ClipPath(
            clipper: ClassClipPathTop(),
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
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            image: DecorationImage(
                        image: NetworkImage(
                            "https://picsum.photos/id/1060/536/354"),
                        fit: BoxFit.cover,
                      ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("S.M Husain. A", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),

                        Text("Kelas 3A", style: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
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
                        "Info Siswa",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),
                      Card(
                        color: Colors.grey[200],
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              ...ListTile.divideTiles(
                                color: Colors.grey,
                                tiles: [
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4
                                  ),
                                  leading: Icon(Icons.key_outlined),
                                  title: Text("No. Induk"),
                                  subtitle: Text("00XX1122"),
                                ),
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4
                                  ),
                                  leading: Icon(Icons.local_hospital),
                                  title: Text("Tempat, Tgl Lahir"),
                                  subtitle: Text("Kebumen, 09 Januari 2015"),
                                ),
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4
                                  ),
                                  leading: Icon(Icons.male_outlined),
                                  title: Text("Jenis Kelamin"),
                                  subtitle: Text("Laki-Laki"),
                                ),
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4
                                  ),
                                  leading: Icon(Icons.bloodtype_rounded),
                                  title: Text("Gol. Darah"),
                                  subtitle: Text("O"),
                                ),
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4
                                  ),
                                  leading: Icon(Icons.my_location),
                                  title: Text("Alamat Domisili"),
                                  subtitle: Text("Pringgolayan RT.08 Banguntapan"),
                                ),
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4
                                  ),
                                  leading: Icon(Icons.phone_android_outlined),
                                  title: Text("No Hp Orang tua"),
                                  subtitle: Text("0896-8830-8147"),
                                ),
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4
                                  ),
                                  leading: Icon(Icons.man_3_outlined),
                                  title: Text("Nama Ayah"),
                                  subtitle: Text("Saefudin"),
                                ),
                                const ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4
                                  ),
                                  leading: Icon(Icons.woman_outlined),
                                  title: Text("Nama Ibu"),
                                  subtitle: Text("Jumariyah"),
                                ),
                                
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ],
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
