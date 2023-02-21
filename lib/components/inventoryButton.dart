// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InventoryButton extends StatelessWidget {
  final String productName;
  final String stock;
  final onPressIt;
  const InventoryButton({
    Key? key,
    required this.productName,
    required this.stock,
    this.onPressIt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressIt,
        child: Card(
          elevation: 2,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      productName,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )),
                Spacer(),
               
                Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      stock,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )),
                Spacer(),
                Container(
                    padding: EdgeInsets.only(left: 10), child: Icon(Icons.add)),
              ],
            ),
          ),
        ));
  }
}
