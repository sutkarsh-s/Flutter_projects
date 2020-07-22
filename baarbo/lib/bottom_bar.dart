import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(45.0),
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Icon(
              FontAwesomeIcons.home,
              color: Colors.red,
              size: 30.0,
              semanticLabel: 'Home',
            ),
            Icon(
              Icons.local_offer,
              color: Colors.green,
              size: 30.0,
            ),
            Icon(
              Icons.call,
              color: Colors.blue,
              size: 36.0,
            ),
            Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 36.0,
            ),
          ],
        ));
  }
}
