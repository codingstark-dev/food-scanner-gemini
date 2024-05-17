import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nutrition_app/models/stored_product.dart';
import 'package:nutrition_app/pages/barcode_info.dart';
import 'package:nutrition_app/resources/utils.dart';

class HistoryTile extends StatelessWidget {
  final StoredProduct product;

  const HistoryTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.theme.colorScheme.primaryContainer,
      elevation: 2,
      child: ListTile(
        onTap: () => Get.to(() => BarcodeInfo(), arguments: {
          'barcode': product.barcode,
        }),
        title: Text(
          product.name,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(DateFormat.MMMEd(Get.locale?.languageCode)
            .format(product.added.toDate())
            .capitalizeFirst!),
        leading: CircleAvatar(
          backgroundColor: Utils.gradeColor(product.grade),
          radius: 18,
          child: Text(
            product.grade.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
