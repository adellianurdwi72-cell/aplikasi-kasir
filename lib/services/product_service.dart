import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product_model.dart';

class ProductService {
  final supabase = Supabase.instance.client;

  // READ ---------------------------------------
  Future<List<Product>> getProducts() async {
    final response = await supabase.from('products').select('*');

    return response.map((item) => Product.fromJson(item)).toList();
  }

  // CREATE ---------------------------------------
  Future<void> addProduct(Product data) async {
    await supabase.from('products').insert(data.toJson());
  }

  // UPDATE ---------------------------------------
  Future<void> updateProduct(int id, Product data) async {
    await supabase.from('products').update(data.toJson()).eq('id', id);
  }

  // DELETE ---------------------------------------
  Future<void> deleteProduct(int id) async {
    await supabase.from('products').delete().eq('id', id);
  }
}
