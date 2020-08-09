import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Option with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String image;

  Option(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.image});

  // void toggleFavoriteStatus() {
  //   isFavorite = !isFavorite;
  //   notifyListeners();
  // }
}
