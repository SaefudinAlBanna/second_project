import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:second_project/app/modules/home/widgets_pages/profile_widget.dart';
import '../widgets_pages/home_widget.dart';

class HomeController extends GetxController {
  RxInt indexWidget = 0.obs;

  void changeIndex(int index) {
    indexWidget.value = index;
  }

  final List<Widget> myWidgets = [
    HomeWidget(),
    Center(
      child: Text('ABSENSI'),
    ),
    ProfileWidget(),
  ];

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String idUser = FirebaseAuth.instance.currentUser!.uid;
  String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';
  String emailAdmin = FirebaseAuth.instance.currentUser!.email!;
  late String docIdSiswa;

  @override
  void onInit() {
    super.onInit();
    idSiswa().then((value) {
      docIdSiswa = value;
    }).catchError((error) {
      Get.snackbar('Error', 'Error initializing docIdSiswa: $error');
      // print('Error initializing docIdSiswa: $error');
    });
  }

  Future<String> idSiswa() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshotSiswa = await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('siswa')
        .where('uid', isEqualTo: idUser)
        .get();
    if (querySnapshotSiswa.docs.isNotEmpty) {
      Map<String, dynamic> dataSiswa = querySnapshotSiswa.docs.first.data();
      String docIdSiswa = dataSiswa['nisn'];

      return docIdSiswa;
    } else {
      throw Exception('No student found for the current user.');
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> userStreamBaru() async* {
    QuerySnapshot<Map<String, dynamic>> querySnapshotSiswa = await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('siswa')
        .where('uid', isEqualTo: idUser)
        .get();
    if (querySnapshotSiswa.docs.isNotEmpty) {
      Map<String, dynamic> dataSiswa = querySnapshotSiswa.docs.first.data();
      String docIdSiswa = dataSiswa['nisn'];

      // String docIdSiswa = await idSiswa();

      yield* firestore
          .collection('Sekolah')
          .doc(idSekolah)
          .collection('siswa')
          .doc(docIdSiswa)
          .snapshots();
    }
  }

  Future<String> getTahunAjaranTerakhir() async {
    CollectionReference<Map<String, dynamic>> colTahunAjaran = firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran');
    QuerySnapshot<Map<String, dynamic>> snapshotTahunAjaran =
        await colTahunAjaran.get();
    List<Map<String, dynamic>> listTahunAjaran =
        snapshotTahunAjaran.docs.map((e) => e.data()).toList();
    String tahunAjaranTerakhir =
        listTahunAjaran.map((e) => e['namatahunajaran']).toList().last;
    return tahunAjaranTerakhir;
  }

  Future<String> getSemesterTerakhir() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");

    CollectionReference<Map<String, dynamic>> colSemester = firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('semester');
    QuerySnapshot<Map<String, dynamic>> snapshotSemester =
        await colSemester.get();
    List<Map<String, dynamic>> listSemester =
        snapshotSemester.docs.map((e) => e.data()).toList();
    String semesterTerakhir =
        listSemester.map((e) => e['namasemester']).toList().last;
    return semesterTerakhir;
  }

  Future<String> getDataKelas() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");

    QuerySnapshot<Map<String, dynamic>> snapColKelas = await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('siswa')
        .doc(docIdSiswa)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('kelasnya')
        .get();

    if (snapColKelas.docs.isNotEmpty) {
      return snapColKelas
          .docs.first.id; // Return the first document ID or any relevant data
    } else {
      throw Exception('No class data found for the current student.');
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDataDocKelasSiswa() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    String idKelasnya = await getDataKelas();

    // ignore: non_constant_identifier_names
    CollectionReference<Map<String, dynamic>> ColKelas = firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('siswa')
        .doc(docIdSiswa)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('kelasnya');

    DocumentSnapshot<Map<String, dynamic>> docSnapKelas =
        await ColKelas.doc(idKelasnya).get();

    if (docSnapKelas.exists) {
      return docSnapKelas;
    } else {
      throw Exception('Siswa belum memiliki kelas');
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDataNilai() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    String semesternya = await getSemesterTerakhir();
    // String kelasnya = data.toString();

    print('semesternya(terakhir) = $semesternya');
    print('docIdSiswa = $docIdSiswa');

    QuerySnapshot<Map<String, dynamic>> querySnapshotSiswa = await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('siswa')
        .doc(docIdSiswa)
        .collection('tahunajarankelompok')
        // .doc(idTahunAjaran)
        // .where('uid', isEqualTo: docIdSiswa)
        .get();
    if (querySnapshotSiswa.docs.isNotEmpty) {
      Map<String, dynamic> dataSiswa = querySnapshotSiswa.docs.first.data();
      String faseNya = dataSiswa['fase'];

      print('faseNya = $faseNya');

      QuerySnapshot<Map<String, dynamic>> querySnapshotSiswaAmbilPengampu =
          await firestore
              .collection('Sekolah')
              .doc(idSekolah)
              .collection('siswa')
              .doc(docIdSiswa)
              .collection('tahunajarankelompok')
              .doc(idTahunAjaran)
              .collection('semester')
              .doc(semesternya)
              .collection('kelompokmengaji')
              // .where('uid', isEqualTo: docIdSiswa)
              .get();
      if (querySnapshotSiswaAmbilPengampu.docs.isNotEmpty) {
        Map<String, dynamic> dataSiswaAmbilPengampu =
            querySnapshotSiswaAmbilPengampu.docs.first.data();
        String namaPengampuNya = dataSiswaAmbilPengampu['namapengampu'];
        String tempatmengajiNya = dataSiswaAmbilPengampu['tempatmengaji'];

      print('namaPengampuNya = $namaPengampuNya');
      print('tempatmengajiNya = $tempatmengajiNya');
      
        return await firestore
            .collection('Sekolah')
            .doc(idSekolah)
            .collection('tahunajaran')
            .doc(idTahunAjaran)
            .collection('semester')
            .doc(semesternya)
            .collection('kelompokmengaji')
            .doc(faseNya)
            .collection('pengampu')
            .doc(namaPengampuNya)
            .collection('tempat')
            .doc(tempatmengajiNya)
            .collection('daftarsiswa')
            .doc(docIdSiswa)
            .collection('nilai')
            .orderBy('tanggalinput', descending: true)
            .get();
      }
    }
    throw Exception('No data found for the current student.');
  }
}
