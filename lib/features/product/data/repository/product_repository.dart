import 'package:expiro/features/product/data/models/product_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ProductRepository {
  final Db mongoDb;

  ProductRepository(this.mongoDb);

  Future<List<ProductModel>> fetchProducts(String uid) async {
    final products = await mongoDb
        .collection('products')
        .find(where.eq('uid', uid))
        .toList();
    final productList = products.map((e) => ProductModel.fromJson(e)).toList();
    return productList;
  }

  Future<void> addProduct(String id, ProductModel product) async {
    await mongoDb.collection('products').insertOne(product.toJson());
  }
}
