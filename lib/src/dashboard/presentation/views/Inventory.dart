import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tekDevisalPOS/core/common/widgets/inventoryButton.dart';
import 'package:tekDevisalPOS/core/utils/colors.dart';
import 'package:tekDevisalPOS/src/dashboard/data/datasource/add_stock_remote_data_source.dart';
import 'package:tekDevisalPOS/src/dashboard/data/datasource/products_remote_data_source%20.dart';
import 'package:tekDevisalPOS/src/dashboard/data/models/productsModel.dart';
import 'package:tekDevisalPOS/src/dashboard/widgets/loader_dialog.dart';
import 'package:tekDevisalPOS/src/dashboard/widgets/wave_background.dart';

import '../../widgets/alertDialog.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  static const id = '/Inventory-page';

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  late Future<List<ProductModel>> fetchallProducts;

  @override
  void initState() {
    fetchallProducts = fetchProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      'Inventory',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Quicksand_bold",
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FutureBuilder<List<ProductModel>>(
                    future: fetchallProducts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InventoryButton(
                              productName:
                                  '${snapshot.data![index].name} (Ghs ${snapshot.data![index].selling_price})',
                              stock: '(${snapshot.data![index].total_stock})',
                              onPressIt: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(
                                    context,
                                    snapshot.data![index].total_stock,
                                    snapshot.data![index].id,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Column(
                          children: [
                            Image.asset(
                              "assets/images/inventory.png",
                              height: 100,
                              width: 100,
                              color: Color.fromRGBO(244, 67, 54, 1),
                            ),
                            Text(
                              "${snapshot.error}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Quicksand_regular",
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              "assets/images/inventory.png",
                              height: 100,
                              width: 100,
                              color: Colors.green,
                            ),
                            Text(
                              "No inventory found.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Quicksand_regular",
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopupDialog(
    BuildContext context,
    int currentStock,
    String product_id,
  ) {
    final _stockController = TextEditingController();

    return AlertDialog(
      title: const Text(
        'Increase Product Inventory',
        style: TextStyle(fontFamily: "Quicksand_bold"),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Current stock",
                  style: TextStyle(fontFamily: "Quicksand_regular")),
              Text("$currentStock")
            ],
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _stockController,
            decoration: InputDecoration(
              labelText: 'Enter new stock:',
              labelStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () async {
              var newStock = _stockController.text;
              if (newStock.isEmpty) {
                Fluttertoast.showToast(msg: "New stock required");
              } else if (int.parse(newStock) > currentStock) {
                Fluttertoast.showToast(
                    msg: "New stock cannot be less than current stock");
              } else {
                await addNewStock(
                    context: context,
                    product_id: product_id,
                    new_stock: int.parse(newStock),
                    current_stock: currentStock);
              }
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomePage()),
              // );
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: TheColors.buttonColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: "Quicksand_bold"),
                ),
              ),
            )),
      ],
    );
  }
}
