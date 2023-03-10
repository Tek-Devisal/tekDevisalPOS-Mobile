// coverage:ignore-file
// ignore_for_file: dead_code
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tekDevisalPOS/core/components/server.dart';
import 'package:tekDevisalPOS/core/errors/exceptions.dart';
import 'package:tekDevisalPOS/core/errors/failures.dart';
import 'package:tekDevisalPOS/src/dashboard/data/models/dailySalesModel.dart';
import 'package:tekDevisalPOS/src/dashboard/presentation/views/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<DailySalesModel>> fetchDailySales(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("accessToken").toString();
  String shop_id = prefs.getString("shop_id").toString();

  final url = Uri.parse(
      Server.instance.authority + '/api/v1/invoice/fetch-invoice-per-day');
  final headers = {'Content-Type': 'application/json', 'auth-token': token};
  final body = jsonEncode({'shop_id': shop_id});
  try {
    final response = await http.post(url, headers: headers, body: body);
    // print(response.body);
    dynamic jsonResponse = jsonDecode(response.body)['data'];
    if (jsonResponse is List) {
      return jsonResponse
          .map((data) => DailySalesModel.fromJson(data))
          .toList();
    } else {
      return [DailySalesModel.fromJson(jsonResponse)];
    }
  } catch (e) {
    MiddleServerException(
        context: context, message: e.toString(), prefs: prefs);
    throw ServerException(message: e.toString(), statusCode: 1);
  }
}
