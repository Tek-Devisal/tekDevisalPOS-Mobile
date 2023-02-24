import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kamran/core/common/widgets/inventoryButton.dart';
import 'package:kamran/core/utils/colors.dart';
import 'package:kamran/screens/HomePage.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              'Inventory',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: InventoryButton(
              productName: 'Hunk (TATA)',
              stock: '(1000)',
              onPressIt: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: InventoryButton(productName: 'Hunk (TATA)', stock: '100')),
          Container(
              padding: EdgeInsets.all(10),
              child: InventoryButton(productName: 'Hunk (TATA)', stock: '100')),
          Container(
              padding: EdgeInsets.all(10),
              child: InventoryButton(productName: 'Hunk (TATA)', stock: '100')),
          Container(
              padding: EdgeInsets.all(10),
              child: InventoryButton(productName: 'Hunk (TATA)', stock: '100')),
          Container(
              padding: EdgeInsets.all(10),
              child: InventoryButton(productName: 'Hunk (TATA)', stock: '100')),
          Container(
              padding: EdgeInsets.all(10),
              child: InventoryButton(productName: 'Hunk (TATA)', stock: '100')),
          Container(
              padding: EdgeInsets.all(10),
              child: InventoryButton(productName: 'Hunk (TATA)', stock: '100')),
        ],
      ))
    ]));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Add Product Inventory'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: 'Enter a Number:',
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
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
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )),
      ],
    );
  }
}
