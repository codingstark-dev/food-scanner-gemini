import 'package:nutrition_app/models/nutriments.dart';
import 'package:nutrition_app/models/nutriscore.dart';

class Product {
  final String? code;
  final String? id;
  final String? brands;
  final List<String?> categories;
  final num? completeness;
  final String? ecoscoreGrade;
  final String? imageFrontUrl;
  final String? imageNutritionUrl;
  final String? imageUrl;
  final String? labels;
  final Nutriments nutriments;
  final Nutriscore nutriscore;
  final String? pnnsGroups1;
  final String? pnnsGroups2;
  final String? name;
  final String? origin;

  Product({
    required this.name,
    required this.code,
    required this.origin,
    required this.id,
    required this.brands,
    required this.categories,
    required this.completeness,
    required this.ecoscoreGrade,
    required this.imageFrontUrl,
    required this.imageNutritionUrl,
    required this.imageUrl,
    required this.labels,
    required this.nutriments,
    required this.nutriscore,
    required this.pnnsGroups1,
    required this.pnnsGroups2,
  });
factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    origin: json['origins'],
    name: json['product_name'],
    code: json['code'],
    id: json['id'],
    brands: json['brands'],
    categories: json['categories'].split(', '),
    completeness: json['completeness'] != null ? json['completeness'].toDouble() : 0.0,
    ecoscoreGrade: json['ecoscore_grade'],
    imageFrontUrl: json['image_front_url'],
    imageNutritionUrl: json['image_nutrition_url'],
    imageUrl: json['image_url'],
    labels: json['labels'],
    nutriments: Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>),
    nutriscore: Nutriscore.fromJson(json['nutriscore'] as Map<String, dynamic>),
    pnnsGroups1: json['pnns_groups_1'],
    pnnsGroups2: json['pnns_groups_2'],
  );
}
  @override
  String toString() {
    return 'ProductInfo(code: $code, id: $id, brands: $brands, '
        'categories: $categories, completeness: $completeness, '
        'ecoscoreGrade: $ecoscoreGrade, imageFrontUrl: $imageFrontUrl, '
        'imageNutritionUrl: $imageNutritionUrl, imageUrl: $imageUrl, '
        'labels: $labels, nutriments: $nutriments, nutriscore: $nutriscore, '
        'pnnsGroups1: $pnnsGroups1, pnnsGroups2: $pnnsGroups2)';
  }

  factory Product.empty() {
    return Product(
      origin: '',
      name: '',
      code: '',
      id: '',
      brands: '',
      categories: [],
      completeness: 0,
      ecoscoreGrade: '',
      imageFrontUrl: '',
      imageNutritionUrl: '',
      imageUrl: '',
      labels: '',
      nutriments: Nutriments.empty(),
      nutriscore: Nutriscore.empty(),
      pnnsGroups1: '',
      pnnsGroups2: '',
    );
  }
}
