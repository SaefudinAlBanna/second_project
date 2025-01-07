import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Judul"),),
      body: Stack(
        alignment: AlignmentDirectional.center,

        children: [
          ClipPath(
            // clipper: ClassClipPathTop(), // ini nanti di aktifkan lagi
            child: Container(
              height: 250,
              width: Get.width,
              color: Colors.blue,
            ),
          ),
          Container(
            height: 100,
            width: 150,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class ClassClipPathTop extends CustomClipper {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}