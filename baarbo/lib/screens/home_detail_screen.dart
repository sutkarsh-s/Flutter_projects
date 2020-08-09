import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';
import '../constants.dart';
import 'package:baarbo/screens/tabs_screen.dart';
import '../widgets/option_item.dart';
import '../providers/options.dart';

import '../providers/products.dart';
// import '../providers/prod_options.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final optionId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(optionId);
    final optionsData = Provider.of<Options>(context);
    // final prodData = Provider.of<ProductOptions>(context);
    var options = optionsData.items[0];
    switch (loadedProduct.id) {
      case 'p1':
        options = optionsData.items[0];

        break;
      case 'p2':
        options = optionsData.items[1];

        break;
      case 'p3':
        options = optionsData.items[2];

        break;
      case 'p4':
        options = optionsData.items[3];

        break;
      default:
    }
    final op = options;

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundBlack,
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
        drawer: MainDrawer(),
        //    switch (loadedProduct) {
        //   case loadedPruct.id = 'p1':

        //     break;
        //   default:
        // }
        body: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          itemCount: op.length,
          // physics: NeverScrollableScrollPhysics(),

          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: op[i],
            child: OptionItem(),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: isLandscape ? 13 / 2 : 5 / 2,
            mainAxisSpacing: 20,
          ),
        ),
        bottomNavigationBar: TabsScreen(),
      ),
    );
  }
}
