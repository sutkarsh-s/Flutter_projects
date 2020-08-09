import 'package:flutter/material.dart';
import '../constants.dart';

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  ServiceIcon({this.icon, this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: themeBlue,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              text,
              style: TextStyle(color: themeBlue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
