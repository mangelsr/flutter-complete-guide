import 'dart:io';

import 'package:form_validation/src/providers/products_provdier.dart';
import 'package:rxdart/rxdart.dart';

import 'package:form_validation/src/models/product_model.dart';

class ProductsBloc {
  final _productsController = BehaviorSubject<List<ProductModel>>();
  final _loadingController = BehaviorSubject<bool>();

  final ProductProvider _productProvider = ProductProvider();

  Stream<List<ProductModel>> get productsStream => _productsController.stream;
  Stream<bool> get loadingStream => _loadingController.stream;

  void loadProducts() async {
    final products = await _productProvider.loadProducts();
    _productsController.sink.add(products);
  }

  void addProduct(ProductModel product) async {
    _loadingController.sink.add(true);
    await _productProvider.createProduct(product);
    _loadingController.sink.add(false);
  }

  Future<String> uploadPhoto(File file) async {
    _loadingController.sink.add(true);
    final photoUrl = await _productProvider.uploadImage(file);
    _loadingController.sink.add(false);
    return photoUrl;
  }

  void editProduct(ProductModel product) async {
    _loadingController.sink.add(true);
    await _productProvider.updateProduct(product);
    _loadingController.sink.add(false);
  }

  void deleteProduct(String id) async {
    await _productProvider.deleteProduct(id);
  }

  dispose() {
    _productsController.close();
    _loadingController.close();
  }
}
