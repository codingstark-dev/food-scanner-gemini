import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:nutrition_app/controllers/barcode_info_controller.dart';
import 'package:nutrition_app/resources/utils.dart';

class BarcodeInfo extends StatelessWidget {
  BarcodeInfo({super.key});
  final controller = Get.put(InfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Info')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (controller.product.value.imageUrl?.isNotEmpty ?? false)
                  Container(
                    color: Colors.grey[200],
                    width: Get.width * 0.8,
                    height: Get.height * 0.4,
                    child: FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      child: Image.network(
                          controller.product.value.imageUrl ?? ''),
                    ),
                  ),
                Text(controller.product.value.name ?? ''),
                Text(controller.product.value.brands ?? ''),
                TextButton(
                    onPressed: () => controller.showNutriments(),
                    child: const Text('Nutritional information')),
                //Text(controller.product!.value.nutriments.toString()),
                const SizedBox(height: 12),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Utils.gradeColor(
                      controller.product.value.nutriscore.grade),
                  child: Text(
                    controller.product.value.nutriscore.grade.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                        text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: controller
                              .product.value.nutriscore.negativeScore
                              .toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                            text:
                                ' / ${controller.product.value.nutriscore.maxNegativeScore}'),
                      ],
                    )),
                    IconButton(
                      onPressed: () {
                        controller.showNegative();
                      },
                      icon: const Icon(Icons.info),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                        text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: controller
                              .product.value.nutriscore.positiveScore
                              .toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.green,
                          ),
                        ),
                        TextSpan(
                            text:
                                ' / ${controller.product.value.nutriscore.maxPositiveScore}'),
                      ],
                    )),
                    IconButton(
                      onPressed: () {
                        controller.showPositive();
                      },
                      icon: const Icon(Icons.info),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                TextButton(
                    onPressed: () => controller.generateContent(
                        product: controller.product.value),
                    child: const Text('Generate Analysis (AI)')),
                controller.loadingContent == true
                    ? const CircularProgressIndicator()
                    : controller.content.value.isEmpty
                        ? const Text('No AI content generated')
                        :Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(controller.content.value),
                        ),

                //Text(controller.product!.value.labels),
              ],
            ),
          ),
        );
      }),
    );
  }
}
