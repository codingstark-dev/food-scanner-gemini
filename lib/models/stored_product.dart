import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutrition_app/models/product.dart';

class StoredProduct {
  final String? documentId;
  final String uid;
  final String name;
  final String grade;
  final Timestamp added;
  final bool isFavorite;
  final String imageUrl;
  final String barcode;

  StoredProduct({
    this.documentId,
    required this.uid,
    required this.name,
    required this.added,
    required this.grade,
    required this.isFavorite,
    required this.imageUrl,
    required this.barcode,
  });
double? convertToDouble(dynamic value) {
  if (value != null) {
    return value.toDouble();
  }
  return null;
}
  factory StoredProduct.fromJson(
      Map<String, dynamic> json, String? documentId) {
    return StoredProduct(
      documentId: documentId,
      uid: json['uid'],
      name: json['name'],
      grade: json['grade'],
      added: json['added'] as Timestamp,
      //added: DateTime.parse(json['added']),
      isFavorite: json['isFavorite'],
      imageUrl: json['imageUrl'],
      barcode: json['barcode'],
    );
  }

  factory StoredProduct.fromProduct(Product product, String uid) {
    return StoredProduct(
      uid: uid,
      name: product.name ?? '',
      grade: product.nutriscore.grade,
      added: Timestamp.now(),
      isFavorite: false,
      imageUrl: product.imageUrl ?? '',
      barcode: product.code ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'grade': grade,
      'added': added,
      'isFavorite': isFavorite,
      'imageUrl': imageUrl,
      'barcode': barcode,
    };
  }

  StoredProduct copyWith({
    String? documentId,
    String? uid,
    String? name,
    String? grade,
    Timestamp? added,
    bool? isFavorite,
    String? imageUrl,
    String? barcode,
  }) {
    return StoredProduct(
      documentId: documentId ?? this.documentId,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      added: added ?? this.added,
      isFavorite: isFavorite ?? this.isFavorite,
      imageUrl: imageUrl ?? this.imageUrl,
      barcode: barcode ?? this.barcode,
    );
  }
}
