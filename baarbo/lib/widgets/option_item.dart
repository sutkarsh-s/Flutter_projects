import 'package:baarbo/providers/prod_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/salons_screen.dart';
// import '../screens/home_detail_screen.dart';
import '../providers/option.dart';
// import '../providers/product.dart';
//import '../providers/cart.dart';

class OptionItem extends StatelessWidget {
  static const routeName = '/option-detail';
  @override
  Widget build(BuildContext context) {
    final option = Provider.of<Option>(context, listen: false);
    // final prodoption = Provider.of<ProductOption>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: GridTile(
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.5,
          color: Colors.grey[700],
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        option.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        'Price : ${option.price}',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(option.image), fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                SalonScreen.routeName,
                // arguments: product.id,
              );
            },
          ),
        ),
      ),
    );
  }
}
