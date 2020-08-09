import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String txt;
  CustomTile({this.txt, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              txt,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
