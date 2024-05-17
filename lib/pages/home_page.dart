import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrition_app/controllers/home_controller.dart';
import 'package:nutrition_app/models/stored_product.dart';
import 'package:nutrition_app/pages/barcode_page.dart';
import 'package:nutrition_app/resources/database.dart';
import 'package:nutrition_app/widgets/history_tile.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final _controller = Get.put(HomeController());
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: _buildDrawer(context),
        appBar: AppBar(
          title: Text(title),
        ),
        body: StreamBuilder(
            stream: DatabaseCommands().getHistory(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error occurred'),
                );
              }
              if (snapshot.hasData) {
                final List<StoredProduct> storedProducts = snapshot.data!.docs
                    .map((e) => e.data() as StoredProduct)
                    .toList();
                _controller.storedProducts = storedProducts;
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: storedProducts.length,
                  itemBuilder: (context, index) {
                    /*  final storedProducts =
                        data.docs[index].data() as StoredProduct; */
                    return HistoryTile(product: storedProducts[index]);
                  },
                );
              }
              return const Center(
                child: Text('Search to add products to your history'),
              );
            })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => BarcodeScannerPage());
          },
          tooltip: 'Scan Barcode',
          child: const Icon(Icons.barcode_reader),
        ));
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primaryContainer,
              ),
              child: Center(
                child: Text(
                  'Food Scanner',
                  style: TextStyle(
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              )),
          // ListTile(
          //   title: const Text('Info'),
          //   onTap: () {
          //     _controller.infoApp();
          //   },
          // ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              _controller.logout();
            },
          ),
        ],
      ),
    );
  }
}
