import 'package:flutter/material.dart';
import './salon_page.dart';

//import './homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 40,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
      //home: SalonPage(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => SalonPage(),
        CouponsScreen.routeName: (ctx) => CouponsScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
      },
    );
  }
}
