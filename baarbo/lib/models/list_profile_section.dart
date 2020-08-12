import 'dart:ui';

import 'package:flutter/material.dart';

class ListProfileSection {
  String title;
  Color color;
  IconData dicon;
  String description;
  Widget widget;

  ListProfileSection(
      this.title, this.color, this.dicon, this.description, this.widget);
}

class ListSettingSection {
  String title;
  String icon;
  Color color;
  String description;
  Widget widget;

  ListSettingSection(
      this.title, this.icon, this.color, this.description, this.widget);
}
