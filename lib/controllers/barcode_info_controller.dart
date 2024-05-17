import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:nutrition_app/controllers/home_controller.dart';
import 'package:nutrition_app/models/product.dart';
import 'package:nutrition_app/resources/api.dart';
import 'package:nutrition_app/resources/database.dart';
import 'package:nutrition_app/resources/utils.dart';

class InfoController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rx<Product> product = Product.empty().obs;
  final String barcode = Get.arguments['barcode'];
  final gemini = Gemini.instance;
  final RxBool loadingContent = false.obs;

final RxString  content = ''.obs;
  @override
  void onInit() async {
    isLoading.value = true;
    try {
      product.value = await Api.getData(barcode);

      final matches = Get.find<HomeController>()
          .storedProducts
          .where((element) => element.barcode == barcode);
      if (matches.isNotEmpty) {
        DatabaseCommands().updateProduct(matches.first);
      } else {
        DatabaseCommands().addProduct(product.value);
      }
    } catch (e) {
      Get.back(closeOverlays: true);
      log('errore: ${e.toString()}', name: 'InfoController');
      if (e is ApiException) {
        Utils.showSnackBar(e.message);
      } else if (e is ProductNotFoundException) {
        Utils.showSnackBar('Product not found in the database');
      } else {
        print('errore: ${e.toString()}');
      }
    } finally {
      isLoading.value = false;
    }
    super.onInit();
  }

generateContent(
  {
    required Product product,
  }
)async {
  try {
  loadingContent.value = true;
  //   final parts = [];
  // final config = GenerationConfig(
  //   temperature: 0.5,
  //   maxOutputTokens: 6000,
  //   topP: 1.0,
  //   topK: 40,
  //   stopSequences: []
  // );
     final text = await gemini.text(
      "Give me advantange and disadvantage of this product: ${product.name} ${product.brands}  Barcode: ${barcode}",
      // generationConfig: config
    );
    content.value = text!.content?.parts!.map((e) => e.text).join(' ') ?? '';
    loadingContent.value = false;
    log('content: ${
      content.value}', name: 'InfoController');
} on Exception catch (e) {
  log('errore: ${e.toString()}', name: 'InfoController');

}
  }

  void showNegative() {
    String toFixed(double val, [int fixed = 0]) {
      return val.toStringAsFixed(fixed);
    }

    Get.defaultDialog(
      title: 'Negative points',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.value.nutriscore.canShowEnergy)
            Text(
                'Energy: ${product.value.nutriscore.energyPoints} / ${product.value.nutriscore.energyPointsMax} (${toFixed(product.value.nutriments.energyKcal!)} ${product.value.nutriments.energyKcalUnit})'),
          if (product.value.nutriscore.canShowSaturatedFat)
            Text(
                'Saturated fats: ${product.value.nutriscore.saturatedFatPoints} / ${product.value.nutriscore.saturatedFatPointsMax} (${toFixed(product.value.nutriments.saturatedFat!)} ${product.value.nutriments.saturatedFatUnit})'),
          if (product.value.nutriscore.canShowSugars)
            Text(
                'Sugars: ${product.value.nutriscore.sugarsPoints} / ${product.value.nutriscore.sugarsPointsMax} (${toFixed(product.value.nutriments.sugars!)} ${product.value.nutriments.sugarsUnit})'),
          if (product.value.nutriscore.canShowSalt)
            Text(
                'Sale: ${product.value.nutriscore.saltPoints} / ${product.value.nutriscore.saltPointsMax} (${toFixed(product.value.nutriments.salt!, 2)} ${product.value.nutriments.saltUnit})'),
          if (product.value.nutriscore.canShowSodium)
            Text(
                'Sodium: ${product.value.nutriscore.sodiumPoints} / ${product.value.nutriscore.sodiumPointsMax}'),
        ],
      ),
      textCancel: 'Close',
    );
  }

  void showPositive() {
    String toFixed(double val, [int fixed = 0]) {
      return val.toStringAsFixed(fixed);
    }

    Get.defaultDialog(
      title: 'Positive points',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.value.nutriscore.canShowFiber)
            Text(
                'Fibre: ${product.value.nutriscore.fiberPoints} / ${product.value.nutriscore.fiberPointsMax}'),
          if (product
              .value.nutriscore.canShowFruitsVegetablesNutsColzaWalnutOliveOils)
            Text(
                'Fruit, vegetables, legumes: ${product.value.nutriscore.fruitsVegetablesNutsColzaWalnutOliveOilsPoints} / ${product.value.nutriscore.fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax}'),
          if (product.value.nutriscore.canShowProteins)
            Text(
                'Proteins: ${product.value.nutriscore.proteinsPoints} / ${product.value.nutriscore.proteinsPointsMax}'),
        ],
      ),
      textCancel: 'Close',
    );
  }

  void showNutriments() {
    String toFixed(double val, [int fixed = 0]) {
      return val.toStringAsFixed(fixed);
    }

    Get.defaultDialog(
      title: 'Nutritional information per 100g',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Energy: ${toFixed(product.value.nutriments.energyKcal!)} ${product.value.nutriments.energyKcalUnit}'),
          Text(
              'Proteins: ${toFixed(product.value.nutriments.proteins!)} ${product.value.nutriments.proteinsUnit}'),
          Text(
              'Carbohydrates: ${toFixed(product.value.nutriments.carbohydrates!)} ${product.value.nutriments.carbohydratesUnit}'),
          Text(
              'Fats: ${toFixed(product.value.nutriments.fat!)} ${product.value.nutriments.fatUnit}'),
          Text(
              'Saturated fatty acids: ${toFixed(product.value.nutriments.saturatedFat!)} ${product.value.nutriments.saturatedFatUnit}'),
          Text(
              'Sugars: ${toFixed(product.value.nutriments.sugars!)} ${product.value.nutriments.sugarsUnit}'),
          Text(
              'Sale: ${toFixed(product.value.nutriments.salt!, 2)} ${product.value.nutriments.saltUnit}'),
          Text(
              'Fibre: ${toFixed(product.value.nutriments.fiber!)} ${product.value.nutriments.fiberUnit}'),
          Text(
              'Fruits, vegetables, nuts, colza, walnut, olive oils: ${toFixed(product.value.nutriments.fruitsVegetablesNutsColzaWalnutOliveOils!)} ${product.value.nutriments.fruitsVegetablesNutsColzaWalnutOliveOilsUnit}'),
              Text(
              'Nutrition score FR: ${toFixed(product.value.nutriments.nutritionScoreFr!)}'),
              

        ],
      ),
      textCancel: 'Close',
    );
  }
}
