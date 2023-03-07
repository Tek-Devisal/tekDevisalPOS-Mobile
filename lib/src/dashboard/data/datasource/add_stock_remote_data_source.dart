// coverage:ignore-file
// ignore_for_file: dead_code
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tekDevisalPOS/core/common/features/auth/data/models/user_model.dart';
import 'package:tekDevisalPOS/core/common/widgets/spinning_loader.dart';
import 'package:tekDevisalPOS/core/components/server.dart';
import 'package:tekDevisalPOS/core/errors/exceptions.dart';
import 'package:tekDevisalPOS/core/errors/failures.dart';
import 'package:tekDevisalPOS/core/typedef/typedefs.dart';
import 'package:tekDevisalPOS/src/dashboard/presentation/views/HomePage.dart';
import 'package:tekDevisalPOS/src/dashboard/presentation/views/Inventory.dart';
import 'package:tekDevisalPOS/src/dashboard/widgets/alertDialog.dart';
import 'package:tekDevisalPOS/src/dashboard/widgets/loader_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future addNewStock(
    {required BuildContext context,
    required String product_id,
    required int new_stock,
    required int current_stock}) async {
  showLoaderDialog(context);

  final prefs = await SharedPreferences.getInstance();
  String shop_id = prefs.getString("shop_id").toString();
  String token = prefs.getString("accessToken").toString();

  final url =
      Uri.parse(Server.instance.authority + '/api/v1/inventory/edit-inventory');
  final headers = {'Content-Type': 'application/json', 'auth-token': token};
  final body = jsonEncode({
    'product_id': product_id,
    'stock_added': new_stock,
    'current_stock': current_stock
  });
  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      // Navigator.pop(context);
      // Navigator.pop(context);
      Navigator.pushReplacementNamed(context, HomePage.id);
      showtheDialog(context, "Success", "Stock updated successfully");

      return;
    } else {
      Navigator.pop(context);
      showtheDialog(context, "Error", "Something went wrong");
      // print('Failed to increase stock. Status code: ${response.statusCode}');
    }
  } catch (e) {
    MiddleServerException(
        context: context, message: e.toString(), prefs: prefs);
    throw ServerException(message: e.toString(), statusCode: 1);
  }
}
