import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Your Account'),
      ),
    );
  }
}
