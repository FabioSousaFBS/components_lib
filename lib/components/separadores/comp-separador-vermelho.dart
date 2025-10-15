import 'package:flutter/material.dart';

class SeparadorVermelho extends StatelessWidget {
  double? height;

  SeparadorVermelho({
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
              colors: [Colors.red, Colors.white],
              radius: 70,
              tileMode: TileMode.clamp,
            )),
      ),
    );
  }
}
