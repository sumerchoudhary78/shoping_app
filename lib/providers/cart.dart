
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier{
    late Map<String, CartItem> _items = {};

    Map<String, CartItem> get item {
      return {..._items};
    }

    int get itemCount {
      return _items.length;
    }

    double totalAmount(){
      var total = 0.0;
      _items.forEach((key, CartItem) {
        total+= CartItem.price * CartItem.quantity;
      });
      return total;
    }

    void addItem(String productId, double price, String title){
      if(_items.containsKey(productId)){
        //change item quntity;
        _items.update(productId, (value) => CartItem(id: value.id, title: value.title, price: value.price, quantity: value.quantity+1));
      }
      else{
          _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, price: price, quantity: 1));
      }
      notifyListeners();
    }

    void removeItem(String productId){
       _items.remove(productId);
       notifyListeners();
    }

    void removeSingleItem (String productId){
      if(!_items.containsKey(productId)){
        return;
      }
      if(_items[productId]!.quantity>1){
        _items.update(
          productId,
          (existingcartItem) => CartItem(id: existingcartItem.id, title: existingcartItem.title, quantity: existingcartItem.quantity-1, price: existingcartItem.price)
        );
      }
      else{
        _items.remove(productId);
      }
      notifyListeners();
    }

    void clear(){
      _items = {};
      notifyListeners();
    }

}

