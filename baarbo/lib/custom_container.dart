import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget customChild;
  CustomContainer({this.customChild});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: customChild
      ),
    );
  }
}
