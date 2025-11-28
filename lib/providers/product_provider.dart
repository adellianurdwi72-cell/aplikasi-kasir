import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> products = [];
  bool isLoading = false;

  // Ambil data
  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    products = await _service.getProducts();

    isLoading = false;
    notifyListeners();
  }

  // Tambah data
  Future<void> addProduct(Product product) async {
    await _service.addProduct(product);
    await loadProducts();
  }

  // Update data
  Future<void> updateProduct(int id, Product product) async {
    await _service.updateProduct(id, product);
    await loadProducts();
  }

  // Hapus data
  Future<void> deleteProduct(int id) async {
    await _service.deleteProduct(id);
    await loadProducts();
  }
}
