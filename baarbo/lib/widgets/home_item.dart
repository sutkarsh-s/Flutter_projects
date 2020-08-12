import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home_detail_screen.dart';
import '../providers/product.dart';
import 'package:flutter_rating/flutter_rating.dart';
// import '../providers/prod_option.dart';
// import '../providers/product.dart';
//import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    // final prodoption = Provider.of<ProductOption>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
        footer:
            //  Positioned(
            //   bottom: 20,
            //   right: 5,
            //   child:
            Container(
          width: 320,
          color: Colors.black54,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          child: Column(
            children: [
              // child:
              Text(
                product.title,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
              StarRating(
                  size: 20.0,
                  rating: product.rating,
                  color: Colors.orange,
                  borderColor: Colors.grey,
                  starCount: 5),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
