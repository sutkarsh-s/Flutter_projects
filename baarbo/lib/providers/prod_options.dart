import 'package:flutter/material.dart';

import './prod_option.dart';

class ProductOptions with ChangeNotifier {
  List<ProductOption> _items = [
    ProductOption(
      id: 'p1',
      title: 'Salon Cutting Edge',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      image: 'assets/images/salon_image.jpg',
    ),
    ProductOption(
      id: 'p2',
      title: 'Salon Ace of Fades',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
      image: 'assets/images/image5.jpg',
    ),
    ProductOption(
      id: 'p3',
      title: 'Salon Upper Cuts',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
      image: 'assets/images/image2.jpg',
    ),
    ProductOption(
        id: 'p4',
        title: 'Salon Curl Me Crazy',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
        image: 'assets/images/image4.jpg'),
  ];
  // var _showFavoritesOnly = false;

  List<ProductOption> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  // List<Product> get favoriteItems {
  //   return _items.where((prodItem) => prodItem.isFavorite).toList();
  // }

  ProductOption findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
