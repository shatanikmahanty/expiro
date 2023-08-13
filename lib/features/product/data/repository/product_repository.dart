import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expiro/features/product/data/models/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProducts(String uid) async {
    final products = await FirebaseFirestore.instance
        .collection('products')
        .where('uid', isEqualTo: uid)
        .get();

    final productList =
        products.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    return productList;
  }

  Future<void> addProduct(String id, ProductModel product) async {
    Map<String, dynamic> productMap = {
      'uid': id,
    };

    productMap.addAll(product.toJson());
    await FirebaseFirestore.instance.collection('products').add(productMap);
  }
}
