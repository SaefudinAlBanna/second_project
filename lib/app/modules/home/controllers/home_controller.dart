import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../widgets_pages/home_widget.dart';

class HomeController extends GetxController {
 RxInt indexWidget = 0.obs;

 void changeIndex(int index){
  indexWidget.value = index;
 }
 final List<Widget> myWidgets = [
    HomeWidget(),
    Center(
        child: Text("News",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
      ),
    Center(
        child: Text("Profile",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
      ),
  ];
}
