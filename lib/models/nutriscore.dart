class Nutriscore {
  /*
    "2021": {
        "category_available": 1,
        "data": {
            "energy": 2017,
            "energy_points": 6,
            "energy_value": 2017,
            "fiber": 5,
            "fiber_points": 5,
            "fiber_value": 5,
            "fruits_vegetables_nuts_colza_walnut_olive_oils": 2.5,
            "fruits_vegetables_nuts_colza_walnut_olive_oils_points": 0,
            "fruits_vegetables_nuts_colza_walnut_olive_oils_value": 2.5,
            "is_beverage": 0,
            "is_cheese": 0,
            "is_fat": 0,
            "is_water": 0,
            "negative_points": 22,
            "positive_points": 5,
            "proteins": 4.7,
            "proteins_points": 2,
            "proteins_value": 4.7,
            "saturated_fat": 5.3,
            "saturated_fat_points": 5,
            "saturated_fat_value": 5.3,
            "sodium": 1300,
            "sodium_points": 10,
            "sodium_value": 1300,
            "sugars": 5.5,
            "sugars_points": 1,
            "sugars_value": 5.5
        },
        "grade": "d",
        "nutrients_available": 1,
        "nutriscore_applicable": 1,
        "nutriscore_computed": 1,
        "score": 17
    },
    "2023": {
        "category_available": 1,
        "data": {
            "components": {
                "negative": [
                    {
                        "id": "energy",
                        "points": 6,
                        "points_max": 10,
                        "unit": "kJ",
                        "value": 2017
                    },
                    {
                        "id": "sugars",
                        "points": 1,
                        "points_max": 15,
                        "unit": "g",
                        "value": 5.5
                    },
                    {
                        "id": "saturated_fat",
                        "points": 5,
                        "points_max": 10,
                        "unit": "g",
                        "value": 5.3
                    },
                    {
                        "id": "salt",
                        "points": 16,
                        "points_max": 20,
                        "unit": "g",
                        "value": 3.25
                    }
                ],
                "positive": [
                    {
                        "id": "fiber",
                        "points": 2,
                        "points_max": 5,
                        "unit": "g",
                        "value": 5
                    },
                    {
                        "id": "fruits_vegetables_legumes",
                        "points": 0,
                        "points_max": 5,
                        "unit": "%",
                        "value": 0
                    }
                ]
            },
            "count_proteins": 0,
            "count_proteins_reason": "negative_points_greater_than_or_equal_to_11",
            "is_beverage": 0,
            "is_cheese": 0,
            "is_fat_oil_nuts_seeds": 0,
            "is_red_meat_product": 0,
            "is_water": 0,
            "negative_points": 28,
            "negative_points_max": 55,
            "positive_nutrients": [
                "fiber",
                "fruits_vegetables_legumes"
            ],
            "positive_points": 2,
            "positive_points_max": 10
        },
        "grade": "e",
        "nutrients_available": 1,
        "nutriscore_applicable": 1,
        "nutriscore_computed": 1,
        "score": 26
    }
  */
  final bool is2023;
  final String grade;

  final int score;
  final int negativeScore;
  final int positiveScore;

  final int energyPoints;
  final int energyPointsMax;
  final int fiberPoints;
  final int fiberPointsMax;
  final int fruitsVegetablesNutsColzaWalnutOliveOilsPoints;
  final int fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax;
  final int proteinsPoints;
  final int proteinsPointsMax;
  final int saturatedFatPoints;
  final int saturatedFatPointsMax;
  final int sodiumPoints;
  final int sodiumPointsMax;
  final int sugarsPoints;
  final int sugarsPointsMax;
  final int saltPoints;
  final int saltPointsMax;

  final bool isBeverage;
  final bool isCheese;
  final bool isFatOilNutsSeeds;
  final bool isRedMeatProduct;
  final bool isWater;
  Nutriscore({
    required this.negativeScore,
    required this.positiveScore,
    required this.is2023,
    required this.grade,
    required this.score,
    required this.isBeverage,
    required this.isCheese,
    required this.isFatOilNutsSeeds,
    required this.isWater,
    required this.isRedMeatProduct,
    required this.energyPoints,
    required this.energyPointsMax,
    required this.fiberPoints,
    required this.fiberPointsMax,
    required this.fruitsVegetablesNutsColzaWalnutOliveOilsPoints,
    required this.fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax,
    required this.proteinsPoints,
    required this.proteinsPointsMax,
    required this.saturatedFatPoints,
    required this.saturatedFatPointsMax,
    required this.sodiumPoints,
    required this.sodiumPointsMax,
    required this.sugarsPoints,
    required this.sugarsPointsMax,
    required this.saltPoints,
    required this.saltPointsMax,
  });

  int get maxNegativeScore =>
      energyPointsMax + sugarsPointsMax + saturatedFatPointsMax + saltPointsMax;

  int get maxPositiveScore =>
      fiberPointsMax +
      fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax +
      proteinsPointsMax;
  bool get canShowSalt => saltPointsMax > 0;
  bool get canShowProteins => proteinsPointsMax > 0;
  bool get canShowSodium => sodiumPointsMax > 0;
  bool get canShowFruitsVegetablesNutsColzaWalnutOliveOils =>
      fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax > 0;
  bool get canShowSaturatedFat => saturatedFatPointsMax > 0;
  bool get canShowSugars => sugarsPointsMax > 0;
  bool get canShowEnergy => energyPointsMax > 0;
  bool get canShowFiber => fiberPointsMax > 0;

  factory Nutriscore.fromJson(Map<String, dynamic> json) {
    bool is2023 = json.containsKey('2023');
    json = is2023 ? json['2023'] : json['2021'];
    if (json['category_available'] == 0 || json['nutriscore_computed'] == 0) {
      return Nutriscore.empty();
    }

    return Nutriscore(
      is2023: is2023,
      grade: json['grade'],
      score: json['score'],
      isBeverage: json['is_beverage'] == 1,
      isCheese: json['is_cheese'] == 1,
      isFatOilNutsSeeds:
          (is2023 ? json['is_fat'] : json['is_fat_oil_nuts_seeds']) == 1,
      isRedMeatProduct: (is2023 ? json['is_red_meat_product'] : false) == 1,
      isWater: json['is_water'] == 1,
      energyPoints: is2023
          ? json['data']['components']['negative'][0]['points']
          : json['data']['energy_points'],
      energyPointsMax:
          is2023 ? json['data']['components']['negative'][0]['points_max'] : 10,
      fiberPoints: is2023
          ? json['data']['components']['positive'][0]['points']
          : json['data']['fiber_points'],
      fiberPointsMax:
          is2023 ? json['data']['components']['positive'][0]['points_max'] : 5,
      fruitsVegetablesNutsColzaWalnutOliveOilsPoints: is2023
          ? json['data']['components']['positive'][1]['points']
          : json['data']
              ['fruits_vegetables_nuts_colza_walnut_olive_oils_points'],
      fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax:
          is2023 ? json['data']['components']['positive'][1]['points_max'] : 5,
      proteinsPoints: is2023
          ? (json['count_proteins'] == 1
              ? json['data']['components']['positive'][2]
              : 0)
          : json['data']['proteins_points'],
      proteinsPointsMax: is2023
          ? (json['count_proteins'] == 1
              ? json['data']['components']['positive'][2]['points_max']
              : 0)
          : 5,
      saturatedFatPoints: is2023
          ? json['data']['components']['negative'][2]['points']
          : json['data']['saturated_fat_points'],
      saturatedFatPointsMax:
          is2023 ? json['data']['components']['negative'][2]['points_max'] : 10,
      sodiumPoints: is2023 ? 0 : json['data']['sodium_points'],
      sodiumPointsMax: is2023 ? 0 : 10,
      sugarsPoints: is2023
          ? json['data']['components']['negative'][1]['points']
          : json['data']['sugars_points'],
      sugarsPointsMax:
          is2023 ? json['data']['components']['negative'][1]['points_max'] : 10,
      saltPoints:
          is2023 ? json['data']['components']['negative'][3]['points'] : 0,
      saltPointsMax:
          is2023 ? json['data']['components']['negative'][3]['points_max'] : 0,
      negativeScore: json['data']['negative_points'],
      positiveScore: json['data']['positive_points'],
    );
  }

  @override
  String toString() {
    return 'Nutriscore(grade: $grade, score: $score)';
  }

  factory Nutriscore.empty() {
    return Nutriscore(
      is2023: false,
      grade: '',
      score: 0,
      isBeverage: false,
      isCheese: false,
      isFatOilNutsSeeds: false,
      isRedMeatProduct: false,
      isWater: false,
      energyPoints: 0,
      energyPointsMax: 0,
      fiberPoints: 0,
      fiberPointsMax: 0,
      fruitsVegetablesNutsColzaWalnutOliveOilsPoints: 0,
      fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax: 0,
      proteinsPoints: 0,
      proteinsPointsMax: 0,
      saturatedFatPoints: 0,
      saturatedFatPointsMax: 0,
      sodiumPoints: 0,
      sodiumPointsMax: 0,
      sugarsPoints: 0,
      sugarsPointsMax: 0,
      saltPoints: 0,
      saltPointsMax: 0,
      negativeScore: 0,
      positiveScore: 0,
    );
  }
}
