import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Cart Items'),
      ),
    );
  }
}
