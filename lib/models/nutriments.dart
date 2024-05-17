class Nutriments {
  /*
  "nutriments": {
            "carbohydrates_100g": 48,
            "carbohydrates_unit": "g",
            "carbohydrates_value": 48,
            "energy": 2351,
            "energy-kcal": 562,
            "energy-kcal_100g": 562,
            "energy-kcal_unit": "kcal",
            "energy-kcal_value": 562,
            "energy-kcal_value_computed": 551.39999961853,
            "energy_100g": 2351,
            "energy_unit": "kcal",
            "energy_value": 562,
            "fat": 37,
            "fat_100g": 37,
            "fat_unit": "g",
            "fat_value": 37,
            "nutrition-score-fr": 28,
            "nutrition-score-fr_100g": 28,
            "proteins": 6.5999999046326,
            "proteins_100g": 6.5999999046326,
            "proteins_unit": "g",
            "proteins_value": 6.5999999046326,
            "salt": 0.37000000476837,
            "salt_100g": 0.37000000476837,
            "salt_unit": "g",
            "salt_value": 0.37000000476837,
            "saturated-fat": 21,
            "saturated-fat_100g": 21,
            "saturated-fat_unit": "g",
            "saturated-fat_value": 21,
            "sodium": 0.148000001907348,
            "sodium_100g": 0.148000001907348,
            "sodium_unit": "g",
            "sodium_value": 0.148000001907348,
            "sugars": 47,
            "sugars_100g": 47,
            "sugars_unit": "g",
            "sugars_value": 47
        },
  */
  final double? carbohydrates;
  final String? carbohydratesUnit;
  final double? energyKcal;
  final String? energyKcalUnit;
  final double? energyKcalValueComputed;
  final double? energy;
  final String? energyUnit;
  final double? fat;
  final String? fatUnit;
  final double? nutritionScoreFr;
  final double? proteins;
  final String? proteinsUnit;
  final double? salt;
  final String? saltUnit;
  final double? saturatedFat;
  final String? saturatedFatUnit;
  final double? sodium;
  final String? sodiumUnit;
  final double? sugars;
  final String? sugarsUnit;
  final double? fiber;
  final String? fiberUnit;
  final double? fruitsVegetablesNutsColzaWalnutOliveOils;
  final String? fruitsVegetablesNutsColzaWalnutOliveOilsUnit;
  final double? nutritionScoreUk;
  final double? novaGroup;
  final double? novaGroup100g;
  final double? fruitsVegetablesNutsColzaWalnutOliveOilsPoints;
  final double? fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax;
  final double? fiberPoints;
  final double? fiberPointsMax;
  final double? proteinsPoints;
  final double? proteinsPointsMax;
  final double? energyPoints;
  final double? energyPointsMax;
  final double? saturatedFatPoints;

  Nutriments({
    this.fiber,
    this.fiberUnit,
    this.fruitsVegetablesNutsColzaWalnutOliveOils,
    this.fruitsVegetablesNutsColzaWalnutOliveOilsUnit,
    this.nutritionScoreUk,
    this.novaGroup,
    this.novaGroup100g,
    this.fruitsVegetablesNutsColzaWalnutOliveOilsPoints,
    this.fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax,
    this.fiberPoints,
    this.fiberPointsMax,
    this.proteinsPoints,
    this.proteinsPointsMax,
    this.energyPoints,
    this.energyPointsMax,
    this.saturatedFatPoints,
    required this.carbohydrates,
    required this.carbohydratesUnit,
    required this.energyKcal,
    required this.energyKcalUnit,
    required this.energyKcalValueComputed,
    required this.energy,
    required this.energyUnit,
    required this.fat,
    required this.fatUnit,
    required this.nutritionScoreFr,
    required this.proteins,
    required this.proteinsUnit,
    required this.salt,
    required this.saltUnit,
    required this.saturatedFat,
    required this.saturatedFatUnit,
    required this.sodium,
    required this.sodiumUnit,
    required this.sugars,
    required this.sugarsUnit,
  });

  factory Nutriments.fromJson(Map<String, dynamic> json) {
    return Nutriments(
      carbohydrates: json['carbohydrates_100g'] != null
          ? json['carbohydrates_100g'].toDouble()
          : 0.0,
      carbohydratesUnit: json['carbohydrates_unit'] ?? '',
      energyKcal: json['energy-kcal_100g'] != null
          ? json['energy-kcal_100g'].toDouble()
          : 0.0,
      energyKcalUnit: json['energy-kcal_unit'] ?? '',
      energyKcalValueComputed: json['energy-kcal_value_computed'] != null
          ? json['energy-kcal_value_computed'].toDouble()
          : 0.0,
      energy:
          json['energy_100g'] != null ? json['energy_100g'].toDouble() : 0.0,
      energyUnit: json['energy_unit'] ?? '',
      fat: json['fat_100g'] != null ? json['fat_100g'].toDouble() : 0.0,
      fatUnit: json['fat_unit'] ?? '',
      nutritionScoreFr: json['nutrition-score-fr_100g'] != null
          ? json['nutrition-score-fr_100g'].toDouble()
          : 0.0,
      proteins: json['proteins_100g'] != null
          ? json['proteins_100g'].toDouble()
          : 0.0,
      proteinsUnit: json['proteins_unit'] ?? '',
      salt: json['salt_100g'] != null ? json['salt_100g'].toDouble() : 0.0,
      saltUnit: json['salt_unit'] ?? '',
      saturatedFat: json['saturated-fat_100g'] != null
          ? json['saturated-fat_100g'].toDouble()
          : 0.0,
      saturatedFatUnit: json['saturated-fat_unit'] ?? '',
      sodium:
          json['sodium_100g'] != null ? json['sodium_100g'].toDouble() : 0.0,
      sodiumUnit: json['sodium_unit'] ?? '',
      sugars:
          json['sugars_100g'] != null ? json['sugars_100g'].toDouble() : 0.0,
      sugarsUnit: json['sugars_unit'] ?? '',
      fiber: json['fiber_100g'] != null ? json['fiber_100g'].toDouble() : 0.0,
      fiberUnit: json['fiber_unit'] ?? '',
      fruitsVegetablesNutsColzaWalnutOliveOils: json['fruits-vegetables-nuts-colza-walnut-olive-oils_100g'] != null
          ? json['fruits-vegetables-nuts-colza-walnut-olive-oils_100g'].toDouble()
          : 0.0,
      fruitsVegetablesNutsColzaWalnutOliveOilsUnit: json['fruits-vegetables-nuts-colza-walnut-olive-oils_unit'] ?? '',
      nutritionScoreUk: json['nutrition-score-uk_100g'] != null
          ? json['nutrition-score-uk_100g'].toDouble()
          : 0.0,
      novaGroup: json['nova-group_100g'] != null

          ? json['nova-group_100g'].toDouble()
          : 0.0,
      novaGroup100g: json['nova-group_100g'] != null
          ? json['nova-group_100g'].toDouble()
          : 0.0,
      fruitsVegetablesNutsColzaWalnutOliveOilsPoints: json['fruits-vegetables-nuts-colza-walnut-olive-oils_points'] != null
          ? json['fruits-vegetables-nuts-colza-walnut-olive-oils_points'].toDouble()
          : 0.0,
      fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax: json['fruits-vegetables-nuts-colza-walnut-olive-oils_points_max'] != null
          ? json['fruits-vegetables-nuts-colza-walnut-olive-oils_points_max'].toDouble()
          : 0.0,
      fiberPoints: json['fiber_points'] != null
          ? json['fiber_points'].toDouble()
          : 0.0,
      fiberPointsMax: json['fiber_points_max'] != null

          ? json['fiber_points_max'].toDouble()
          : 0.0,
      proteinsPoints: json['proteins_points'] != null
          ? json['proteins_points'].toDouble()
          : 0.0,
      proteinsPointsMax: json['proteins_points_max'] != null
          ? json['proteins_points_max'].toDouble()
          : 0.0,
      energyPoints: json['energy_points'] != null
          ? json['energy_points'].toDouble()
          : 0.0,
      energyPointsMax: json['energy_points_max'] != null
          ? json['energy_points_max'].toDouble()
          : 0.0,
      saturatedFatPoints: json['saturated-fat_points'] != null
          ? json['saturated-fat_points'].toDouble()
          : 0.0,

    );
  }
  factory Nutriments.empty() {
    return Nutriments(
      carbohydrates: 0,
      carbohydratesUnit: '',
      energyKcal: 0,
      energyKcalUnit: '',
      energyKcalValueComputed: 0,
      energy: 0,
      energyUnit: '',
      fat: 0,
      fatUnit: '',
      nutritionScoreFr: 0,
      proteins: 0,
      proteinsUnit: '',
      salt: 0,
      saltUnit: '',
      saturatedFat: 0,
      saturatedFatUnit: '',
      sodium: 0,
      sodiumUnit: '',
      sugars: 0,
      sugarsUnit: '',
      fiber: 0,
      fiberUnit: '',
      fruitsVegetablesNutsColzaWalnutOliveOils: 0,
      fruitsVegetablesNutsColzaWalnutOliveOilsUnit: '',
      nutritionScoreUk: 0,
      novaGroup: 0,
      novaGroup100g: 0,
      fruitsVegetablesNutsColzaWalnutOliveOilsPoints: 0,
      fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax: 0,
      fiberPoints: 0,
      fiberPointsMax: 0,
      proteinsPoints: 0,
      proteinsPointsMax: 0,
      energyPoints: 0,
      energyPointsMax: 0,
      saturatedFatPoints: 0,
        
    );
  }
}
