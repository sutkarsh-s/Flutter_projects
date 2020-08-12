// import 'package:baarbo/providers/prod_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './home_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    // final prodData = Provider.of<ProductOptions>(context);
    final products = productsData.items;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: isLandscape ? 5 : 3 / 2,
        // crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      // ),
      // ),
    );
  }
}
