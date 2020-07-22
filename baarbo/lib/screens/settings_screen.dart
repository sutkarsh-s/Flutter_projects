import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seetings'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
