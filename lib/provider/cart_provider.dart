import 'package:flutter/material.dart';
import 'package:nikkle_app/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _list = [];

  void add(CartModel data) {
    int i = _list.indexWhere((v) => v.id == data.id);
    if (i == -1) {
      _list.add(data);
      notifyListeners();
    } else {
      addByIndex(i);
    }
  }

  void addByIndex(index) {
    _list[index].qty = _list[index].qty + 1;
    _list[index].amt = _list[index].amt + _list[index].rate;
    notifyListeners();
  }

  void removeByIndex(index) {
    int qty = _list[index].qty - 1;
    if (qty >= 1) {
      _list[index].qty = qty;
      _list[index].amt = _list[index].amt - _list[index].rate;
    } else {
      _list.removeAt(index);
    }
    notifyListeners();
  }

  void remove(index) {
    _list.removeAt(index);
    notifyListeners();
  }

  List<CartModel> get list => _list;
}
