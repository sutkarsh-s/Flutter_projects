import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderPalette extends StatelessWidget {
  final IconData icon;
  final String genderText;
  final Function onPressed;

  GenderPalette({this.icon, this.genderText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 80.0,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                genderText,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GenderPalette(
          icon: FontAwesomeIcons.mars,
          genderText: 'Male',
          onPressed: () {},
        ),
        GenderPalette(
          icon: FontAwesomeIcons.venus,
          genderText: 'Female',
          onPressed: () {},
        ),
      ],
    );
  }
}
