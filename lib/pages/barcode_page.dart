import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nutrition_app/controllers/barcode_controller.dart';

class BarcodeScannerPage extends StatelessWidget {
  BarcodeScannerPage({super.key});
  final BarcodeController controller =
      Get.put(BarcodeController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(const Offset(0, -48)),
      width: Get.width * 0.8,
      height: Get.width * 0.45,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Scanner'),
        toolbarHeight: 60,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            //fit: BoxFit.contain,
            onDetect: controller.onDetect,
            overlay: const BarcodeScannerOverlay(),
            scanWindow: scanWindow,
          ),
          /* _buildScanner(scanWindow) */
        ],
      ),
    );
  }
}

class BarcodeScannerOverlay extends StatelessWidget {
  const BarcodeScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      left: context.width * 0.1,
      right: context.width * 0.1,
      child: Center(
        child: AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
