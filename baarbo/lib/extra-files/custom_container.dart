import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget customChild;
  CustomContainer({this.customChild});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Container(
        height: isLandscape
            ? MediaQuery.of(context).size.height * 1.2
            : MediaQuery.of(context).size.height * 0.62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: customChild);
  }
}
