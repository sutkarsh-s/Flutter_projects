import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home_detail_screen.dart';
import '../providers/product.dart';
import '../providers/prod_option.dart';
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
      ),
    );
  }
}
