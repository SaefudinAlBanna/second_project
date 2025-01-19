// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class People {
  String? mapel;
  int? skk;
  int? kkm;
  int? nilaiModul1;
  int? nilaiModul2;
  int? nilaiModul3;
  String? predikatModul1;
  String? predikatModul2;
  String? predikatModul3;

  People(
      {this.mapel,
      this.skk,
      this.kkm,
      this.nilaiModul1,
      this.nilaiModul2,
      this.nilaiModul3,
      this.predikatModul1,
      this.predikatModul2,
      this.predikatModul3});
}

RxInt sortIndex = 0.obs;
RxBool isAscending = true.obs;
final List<People> people = [
  People(
      mapel: 'Bahasa Indonesia',
      skk: 10,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Matematika',
      skk: 5,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Pendidikan Agama dan Budi Pekerti',
      skk: 6,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'IPA',
      skk: 8,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'IPS',
      skk: 4,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'PPKN',
      skk: 11,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Bahasa Arab',
      skk: 12,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Bahasa Mandarin',
      skk: 9,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Penjaskes',
      skk: 13,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Tahfidz',
      skk: 10,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Adab',
      skk: 8,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Bahasa Inggris',
      skk: 5,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Bahasa Jawa',
      skk: 6,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Bahasa Sunda',
      skk: 4,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'SBDp',
      skk: 9,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Cooking',
      skk: 11,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Renang',
      skk: 12,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
  People(
      mapel: 'Memanah',
      skk: 13,
      kkm: 8,
      nilaiModul1: 85,
      nilaiModul2: 95,
      nilaiModul3: 80,
      predikatModul1: 'A',
      predikatModul2: 'B',
      predikatModul3: 'A'),
];

void sortData() {
  if (sortIndex.value == 0) {
    people.sort((a, b) {
      if (isAscending.value) {
        return a.mapel
            .toString()
            .toLowerCase()
            .compareTo(b.mapel.toString().toLowerCase());
      } else {
        return b.mapel
            .toString()
            .toLowerCase()
            .compareTo(a.mapel.toString().toLowerCase());
      }
    });
  } else {
    people.sort((a, b) {
      if (isAscending.value) {
        return a.skk
            .toString()
            .toLowerCase()
            .compareTo(b.skk.toString().toLowerCase());
      } else {
        return b.skk
            .toString()
            .toLowerCase()
            .compareTo(a.skk.toString().toLowerCase());
      }
    });
  }
}

void onSort(columnIndex, ascending) {
  sortIndex.value = columnIndex;
  isAscending.value = ascending;
  sortData();
}
