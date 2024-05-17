import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nutrition_app/models/product.dart';
import 'package:nutrition_app/pages/barcode_info.dart';

class BarcodeController extends GetxController {
  final RxString barcode = ''.obs;
  final RxBool isLoading = false.obs;
  Rx<Product>? product;
  void setBarcode(String? value) {
    if (value == null) return;
    if (barcode.value == value) return;
    barcode.value = value;

    Get.off(() => BarcodeInfo(), arguments: {'barcode': value});
  }

  void onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;

    if (barcodes.isNotEmpty) {
      setBarcode(barcodes.first.rawValue);
    }
  }
}
