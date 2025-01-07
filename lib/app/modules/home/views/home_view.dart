import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.myWidgets.elementAt(controller.indexWidget.value),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.red.shade800,
          onTap: (value) => controller.changeIndex(value),
          items: [
            TabItem(
              title: "Home",
              icon: Icon(Icons.home),
            ),
            TabItem(
              title: "News",
              icon: Icon(Icons.newspaper_outlined),
            ),
            TabItem(
              title: "Profile",
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
