import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/empty_user.png',
              width: 100,
            ),
            Text(
              '@Username',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}