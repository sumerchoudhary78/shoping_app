import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
        Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://th.bing.com/th/id/OIP.V7Fjjf5ZsBKKVILUKljiPwHaCv?pid=ImgDet&rs=1',
    ),

    Product(
      id: 'p5',
      title: 'Denim Jacket',
      description: 'A classic denim jacket that will never go out of style.',
      price: 89.99,
      imageUrl:
      'https://th.bing.com/th/id/OIP.g6eqjvMfYFMCl43WwKUOHQHaJ4?pid=ImgDet&rs=1',
      ),
    Product(
      id: 'p6',
      title: 'Smartwatch',
      description: 'A high-tech smartwatch that can help you track your fitness, stay connected, and more.',
      price: 199.99,
      imageUrl:
      'https://th.bing.com/th/id/OIP.oQ9gioHYyztzuhHEVAu9OQHaHa?pid=ImgDet&rs=1',
      ),

      Product(
      id: 'p7',
      title: 'Travel Backpack',
      description: 'A durable and spacious backpack with multiple compartments for all your travel essentials.',
      price: 89.99,
      imageUrl:
      'https://th.bing.com/th/id/OIP.uOA29cPlJONdBMSF8nJQzQHaHa?pid=ImgDet&rs=1',
      ),

      Product(
      id: 'p8',
      title: 'Water Bottle',
      description: 'An insulated water bottle that will keep your drinks cold for hours.',
      price: 24.99,
      imageUrl:
      'https://th.bing.com/th/id/OIP.wP3LwYLMUQLc22Cmj9AVEQHaHa?pid=ImgDet&rs=1',
      ),

      Product(
      id: 'p9',
      title: 'Yoga Mat',
      description: 'A non-slip yoga mat that provides excellent grip and support during your yoga practice.',
      price: 39.99,
      imageUrl:
      'https://th.bing.com/th/id/OIP.P4-EprgyRCTxLqSgVO0sqQHaF5?pid=ImgDet&rs=1',
      )

  ];
  
  

  List<Product> get items {
    return [..._items];
  }
  
  List<Product> get favoItems{
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id){
    return _items.firstWhere((element) => element.id==id);
  }

  void addProducts(Product product){
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    notifyListeners();
  }
  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

}