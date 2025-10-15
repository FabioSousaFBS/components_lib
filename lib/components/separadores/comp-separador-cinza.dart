// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SeparadorCinza extends StatelessWidget {
  double? height;
  SeparadorCinza({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: height ?? 0),
      child: Container(
        height: 2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            //color: Colors.grey.shade600,
            borderRadius: BorderRadius.circular(10),
            gradient: RadialGradient(
              colors: [Colors.grey, Colors.white],
              radius: 70,
              tileMode: TileMode.clamp,
            )),
      ),
    );
  }
}
