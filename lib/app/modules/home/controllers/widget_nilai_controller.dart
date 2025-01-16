// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class People {
  int? age;
  String? name;

  People({this.age, this.name});
}

RxInt sortIndex = 0.obs;
  RxBool isAscending = true.obs;
  final List<People> people = [
    People(name: 'Husain', age: 10),
    People(name: 'Husna', age: 8),
    People(name: 'Umar', age: 5),
    People(name: 'Saka', age: 6),
    People(name: 'Tsaqif', age: 4),
    People(name: 'Zeyya', age: 9),
    People(name: 'Gholibah', age: 11),
    People(name: 'Arkan', age: 12),
    People(name: 'Althaf', age: 13),
    People(name: 'Husain', age: 10),
    People(name: 'Husna', age: 8),
    People(name: 'Umar', age: 5),
    People(name: 'Saka', age: 6),
    People(name: 'Tsaqif', age: 4),
    People(name: 'Zeyya', age: 9),
    People(name: 'Gholibah', age: 11),
    People(name: 'Arkan', age: 12),
    People(name: 'Althaf', age: 13),
  ];

void sortData() {
    if (sortIndex.value == 0) {
      people.sort((a, b) {
        if (isAscending.value) {
          return a.name
              .toString()
              .toLowerCase()
              .compareTo(b.name.toString().toLowerCase());
        } else {
          return b.name
              .toString()
              .toLowerCase()
              .compareTo(a.name.toString().toLowerCase());
        }
      });
    } else {
      people.sort((a, b) {
        if (isAscending.value) {
          return a.age
              .toString()
              .toLowerCase()
              .compareTo(b.age.toString().toLowerCase());
        } else {
          return b.age
              .toString()
              .toLowerCase()
              .compareTo(a.age.toString().toLowerCase());
        }
      });
    }
  }

  void onSort(columnIndex, ascending) {
    sortIndex.value = columnIndex;
    isAscending.value = ascending;
    sortData();
  }