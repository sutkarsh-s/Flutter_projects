// import 'package:baarbo/models/Carousel.dart';
import 'package:baarbo/screens/tabs_screen.dart';
// import 'package:baarbo/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/main_drawer.dart';
import '../widgets/home_grid.dart';
import '../screens/search_store_screen.dart';
import '../models/carousel.dart';
// import 'package:carousel_pro/carousel_pro.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/Home';
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // static const init = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundBlack,
        appBar: AppBar(
          title: Text("Home"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SearchStore.routeName);
                  },
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'Solons',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselModel(),
              SizedBox(
                height: 20,
              ),
              ProductsGrid(),
            ],
          ),
        ),
        bottomNavigationBar: TabsScreen(),
      ),
    );
  }
}

class CatalogueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Solons',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselModel(),
            SizedBox(
              height: 20,
            ),
            ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
