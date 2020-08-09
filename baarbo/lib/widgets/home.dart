import 'package:baarbo/constants.dart';
import 'package:flutter/material.dart';
import '../screens/catalogue_screen.dart';

class HomeScreen extends StatelessWidget {
  final String id;
  final String imageUrl;

  HomeScreen(this.id, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundBlack,
        body: Column(
          children: <Widget>[
            Text(
              'Salons',
              textAlign: TextAlign.center,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(CatalogueScreen.routeName);
                  },
                  child: Image.asset(
                    './images/empty_user.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
