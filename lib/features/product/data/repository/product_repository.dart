import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expiro/features/product/data/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProducts(String uid) async {
    final products = await FirebaseFirestore.instance.collection('products').where('uid', isEqualTo: uid).get();

    final productList = products.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    return productList;
  }

  Future<void> addProduct(String id, ProductModel product) async {
    Map<String, dynamic> productMap = {
      'uid': id,
    };

    productMap.addAll(product.toJson());
    final docRef = FirebaseFirestore.instance.collection('products').doc();
    productMap['id'] = docRef.id;
    await docRef.set(productMap);
  }

  Future<String?> uploadImage(String id, String imagePath) async {
    final timeStr = DateTime.now().millisecondsSinceEpoch.toString();
    final ext = imagePath.split('.').last;
    final ref = FirebaseStorage.instance.ref().child('products').child(id).child('$timeStr.$ext');
    final uploadTask = ref.putFile(File(imagePath));
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }

  Future<bool> removeProduct(String pid) async {
    try {
      await FirebaseFirestore.instance.collection('products').doc(pid).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setQuantity(String pid, int quantity) async {
    try {
      await FirebaseFirestore.instance.collection('products').doc(pid).update({
        'quantity': quantity,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
