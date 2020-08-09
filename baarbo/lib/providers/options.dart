import 'package:flutter/material.dart';
// import './products.dart';
import './option.dart';

// final optionId =
//     ModalRoute.of(context).settings.arguments as String; // is the id!
// final loadedProduct = Provider.of<Products>(
//   context,
//   listen: false,
// ).findById(optionId);

class Options with ChangeNotifier {
  List<List<Option>> _items = [
    [
      Option(
          id: 'o1',
          title: 'Haircut',
          price: 100,
          image: 'assets/images/hair.png'),
      Option(
        id: 'o2',
        title: 'Beard',
        price: 60,
        image: 'assets/images/beard.jpg',
      ),
      Option(
          id: 'o3',
          title: 'Facial',
          price: 120,
          image: 'assets/images/facial.jpg'),
      Option(
          id: 'o4',
          title: 'Massage',
          price: 150,
          image: 'assets/images/massage2.png'),
    ],
    [
      Option(
          id: 'o1',
          title: 'Haircut',
          price: 200,
          image: 'assets/images/hair.png'),
      Option(
        id: 'o2',
        title: 'Beard',
        price: 100,
        image: 'assets/images/beard.jpg',
      ),
      Option(
          id: 'o3',
          title: 'Facial',
          price: 200,
          image: 'assets/images/facial.jpg'),
      Option(
          id: 'o4',
          title: 'Massage',
          price: 220,
          image: 'assets/images/massage2.png'),
    ],
    [
      Option(
          id: 'o1',
          title: 'Haircut',
          price: 120,
          image: 'assets/images/hair.png'),
      Option(
        id: 'o2',
        title: 'Beard',
        price: 70,
        image: 'assets/images/beard.jpg',
      ),
      Option(
          id: 'o3',
          title: 'Facial',
          price: 150,
          image: 'assets/images/facial.jpg'),
      Option(
          id: 'o4',
          title: 'Massage',
          price: 180,
          image: 'assets/images/massage2.png'),
    ],
    [
      Option(
          id: 'o1',
          title: 'Haircut',
          price: 150,
          image: 'assets/images/hair.png'),
      Option(
        id: 'o2',
        title: 'Beard',
        price: 80,
        image: 'assets/images/beard.jpg',
      ),
      Option(
          id: 'o3',
          title: 'Facial',
          price: 150,
          image: 'assets/images/facial.jpg'),
      Option(
          id: 'o4',
          title: 'Massage',
          price: 200,
          image: 'assets/images/massage2.png'),
    ],
  ];
  // var _showFavoritesOnly = false;

  List<List<Option>> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  // List<Product> get favoriteItems {
  //   return _items.where((prodItem) => prodItem.isFavorite).toList();
  // }

  // Option findById(String id) {
  //   return _items.firstWhere((prod) => prod.id == id);
  // }
}
