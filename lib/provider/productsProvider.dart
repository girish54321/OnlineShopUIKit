import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/modal/products.dart';
import 'package:onlineShopUIKit/network_utils/api.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  Products products;

  ProductsProvider() {
    getProducts();
  }

  getProducts() async {
    try {
      http.Response response = await Network().getHomeScreenPlayList(
          "https://api.jsonbin.io/b/5fd71e677e2e9559b15c92df/1");
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        products = new Products.fromJson(resBody);
        notifyListeners();
      }
    } catch (e) {
      products = null;
      print(e);
      notifyListeners();
    }
  }
}
