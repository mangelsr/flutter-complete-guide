import 'package:flutter/material.dart';

import 'package:beats_app/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  ProductsProvider() {
    _loadProducts();
  }

  List<ProductModel> get products => _products;

  _loadProducts() {
    final prod1 = new ProductModel(
        name: 'Beats Studio3 Wireless',
        title: 'Warriors',
        subtitle: 'Royal Blue',
        price: 349.95,
        batery: 45,
        color: 0xff08399B,
        favorite: false,
        url: 'blue.png');

    final prod2 = new ProductModel(
        name: 'Studio3 Wireless',
        title: 'Warriors',
        subtitle: 'Royal Red',
        price: 300.95,
        batery: 30,
        color: 0xff922325,
        favorite: false,
        url: 'black-red.png');

    final prod3 = new ProductModel(
        name: 'Beats Wireless',
        title: 'Fighter',
        subtitle: 'Space Grey',
        price: 449.95,
        batery: 50,
        color: 0xff252525,
        favorite: false,
        url: 'black.png');

    final prod4 = new ProductModel(
        name: 'Beats Studio3 Wireless',
        title: 'Finest',
        subtitle: 'Royal Gold',
        price: 239.95,
        batery: 25,
        color: 0xffC7B29B,
        favorite: false,
        url: 'gold.png');

    final prod5 = new ProductModel(
        name: 'Beats Studio3',
        title: 'Warriors',
        subtitle: 'Royal Red',
        price: 349.95,
        batery: 45,
        color: 0xffD84C3B,
        favorite: false,
        url: 'red.png');

    final prod6 = new ProductModel(
        name: 'Beats Studio3',
        title: 'Warriors',
        subtitle: 'Royal Teal',
        price: 349.95,
        batery: 45,
        color: 0xff23526D,
        favorite: false,
        url: 'teal.png');

    this._products.addAll([
      prod1,
      prod2,
      prod3,
      prod4,
      prod5,
      prod6,
    ]);
  }
}
