import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/home/data/models/explore_model.dart';

class ExploreRepository {
  ExploreRepository();

  Future<List<ExploreModel>> fetchProducts() async {
    final products =
        await FirebaseFirestore.instance.collection(kExploreCollection).get();

    final blogList =
        products.docs.map((e) => ExploreModel.fromJson(e.data())).toList();

    return blogList;
  }
}
