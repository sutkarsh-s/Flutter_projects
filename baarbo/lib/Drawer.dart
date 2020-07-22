import 'package:flutter/material.dart';
import './customtile.dart';

class Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
    ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        child: Drawer(
          child: Container(
            color: kgreyWeWant,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('images/ray.png'),
                          radius: 28,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'BAARBA',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Raleway',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'www.baarba.com',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffeb4d65),
                  ),
                ),
                CustomTile(
                  txt: 'Home',
                  icon: Icons.home,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CustomTile(
                  txt: 'Coupons',
                  icon: Icons.local_play,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CustomTile(
                  txt: 'Cart',
                  icon: Icons.shopping_cart,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CustomTile(
                  txt: 'Setting',
                  icon: Icons.settings,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ],
      
  }
}
