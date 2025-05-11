import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailNilaiHalaqohController extends GetxController {
  TextEditingController keteranganOrangTuaC = TextEditingController();

  var dataArgument = Get.arguments;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String idUser = FirebaseAuth.instance.currentUser!.uid;
  String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';

  void test() {
    // print("dataArgument['nisn'] = ${dataArgument['idsiswa']}");
    // print("dataArgument = $dataArgument");
  }

  // void simpan() async {
  //   String tahunAjaran = dataArgument['tahunajaran'];
  //   String idTahunAjaran = tahunAjaran.replaceAll("/", "-");

  //   CollectionReference<Map<String, dynamic>> colNilai = firestore
  //       .collection('Sekolah')
  //       .doc(idSekolah)
  //       .collection('tahunajaran')
  //       .doc(idTahunAjaran)
  //       .collection('semester')
  //       .doc(dataArgument['namasemester'])
  //       .collection('kelompokmengaji')
  //       .doc(dataArgument['fase'])
  //       .collection('pengampu')
  //       .doc(dataArgument['namapengampu'])
  //       .collection('tempat')
  //       .doc(dataArgument['tempatmengaji'])
  //       .collection('daftarsiswa')
  //       .doc(dataArgument['idsiswa'])
  //       .collection('nilai');

  //   // QuerySnapshot<Map<String, dynamic>> snapNilai = await colNilai.get();

  //   // Correctly access 'uidnilai' from the dataArgument map
  //   String uidNilai = dataArgument['uidnilai'];
  //   // print('uidNilai = ${dataArgument['uidnilai']}');
  //   // print('=========================================');
  //   // print('snapNilai = $snapNilai');
  //   // print('=========================================');
  //   // print('snapNilai.docs = ${snapNilai.docs}');
  //   // print('=========================================');
  //   // print('colNilai.doc(uidNilai) = ${colNilai.doc(uidNilai)}');

  //   // if (snapNilai.docs.isNotEmpty) {
  //   if (keteranganOrangTuaC.text.isNotEmpty) {
  //     // Update the document with the provided 'uidnilai'
  //     colNilai.doc(uidNilai).update({
  //       "keteranganorangtua": keteranganOrangTuaC.text,
  //     });
  //   }
  // }
  

  void simpan() async {
    String tahunAjaran = dataArgument['tahunajaran'] ?? '';
    String idTahunAjaran = tahunAjaran.replaceAll("/", "-");

    CollectionReference<Map<String, dynamic>> colNilai = firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('semester')
        .doc(dataArgument['namasemester'] ?? '')
        .collection('kelompokmengaji')
        .doc(dataArgument['fase'] ?? '')
        .collection('pengampu')
        .doc(dataArgument['namapengampu'] ?? '')
        .collection('tempat')
        .doc(dataArgument['tempatmengaji'] ?? '')
        .collection('daftarsiswa')
        .doc(dataArgument['idsiswa'] ?? '')
        .collection('nilai');

    // Ensure uidNilai is not null
    String? uidNilai = dataArgument['uidnilai'];
    if (uidNilai == null || uidNilai.isEmpty) {
      Get.snackbar("Error", "tidak ditemukan data nilai, siswa sudah pindah halaqoh");
      return;
    }

    if (keteranganOrangTuaC.text.isNotEmpty) {
      try {
        await colNilai.doc(uidNilai).update({
          "keteranganorangtua": keteranganOrangTuaC.text,
        });
        Get.snackbar("Success", "Data berhasil disimpan");
      } catch (e) {
        Get.snackbar("Error", "Terjadi kesalahan saat menyimpan data, siswa sudah beda pengampu");
      }
    } else {
      Get.snackbar("Error", "Catatan orangtua masih kosong");
    }
  }
}
