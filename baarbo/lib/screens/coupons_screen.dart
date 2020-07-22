import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class CouponsScreen extends StatelessWidget {
  static const routeName = '/Coupons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coupons'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Coupons'),
      ),
    );
  }
}
