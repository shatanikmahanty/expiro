import 'package:expiro/features/app/data/base_repo.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../configurations/configurations.dart';

class MongoRepository extends BaseApiRepository {
  Db? mongoClient;

  ///Singleton
  static final MongoRepository _instance = MongoRepository._internal();

  factory MongoRepository() => _instance;

  MongoRepository._internal();

  @override
  Future<void> init() async {
    mongoClient = await Db.create(kMongoUrl);
    await mongoClient?.open();
  }

  Future<Map<String, dynamic>?> createDocument(
      String collection, Map<String, dynamic> data) async {
    final docData = await mongoClient?.collection(collection).insertOne(data);
    return docData?.document;
  }
}
