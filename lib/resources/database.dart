import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nutrition_app/controllers/main_controller.dart';
import 'package:nutrition_app/models/product.dart';
import 'package:nutrition_app/models/stored_product.dart';

const String historyCollection = 'history';

class DatabaseCommands {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference _historyCollection;
  final _mainController = Get.find<MainController>();
  DatabaseCommands() {
    _historyCollection = _firestore
        .collection(historyCollection)
        .withConverter<StoredProduct>(
            fromFirestore: (snapshot, options) =>
                StoredProduct.fromJson(snapshot.data()!, snapshot.id),
            toFirestore: (product, options) => product.toJson());
  }
  Stream<QuerySnapshot>? getHistory() {
    return _historyCollection
        .where('uid', isEqualTo: _mainController.user!.uid)
        .orderBy('added', descending: true)
        .snapshots();
  }

  void addProduct(Product product) {
    _historyCollection
        .add(StoredProduct.fromProduct(product, _mainController.user!.uid));
  }

  void updateProduct(StoredProduct product) {
    _historyCollection
        .doc(product.documentId)
        .set(product.copyWith(added: Timestamp.now()));
  }
}
