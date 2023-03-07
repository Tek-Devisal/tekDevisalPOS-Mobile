// coverage:ignore-file
// ignore_for_file: dead_code
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:tekDevisalPOS/core/common/features/auth/data/models/user_model.dart';
import 'package:tekDevisalPOS/core/components/server.dart';
import 'package:tekDevisalPOS/core/errors/exceptions.dart';
import 'package:tekDevisalPOS/core/typedef/typedefs.dart';
import 'package:tekDevisalPOS/src/dashboard/presentation/views/HomePage.dart';
import 'package:tekDevisalPOS/src/dashboard/widgets/alertDialog.dart';
import 'package:tekDevisalPOS/src/dashboard/widgets/loader_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signInUser(
    BuildContext context, String email, String password) async {
  showLoaderDialog(context);
  final prefs = await SharedPreferences.getInstance();
  final url = Uri.parse(
      'https://tekdevisalpos-379508.uc.r.appspot.com/api/v1/user/login');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': password});

  try {
    final response = await http.post(url, headers: headers, body: body);
    // print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final accessToken = data['accessToken'] as String?;
      // print(accessToken);
      if (accessToken != null) {
        prefs.setString('email', data['email'] as String);
        prefs.setString('accessToken', accessToken);
        prefs.setString('refreshToken', data['refreshToken'] as String);
        prefs.setString('id', data['id'] as String);
        prefs.setString('usertype', data['usertype'] as String);
        prefs.setString('name', data['name'] as String);
        prefs.setString('shop_name', data['shop_name'] as String);
        prefs.setString('shop_id', data['shop_id'] as String);

        Fluttertoast.showToast(msg: 'Login is successful');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, HomePage.id);
        return;
      } else {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final message = data['message'] as String;
        Navigator.of(context).pop();
        showtheDialog(context, 'Error', message);
      }
    } else {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'] as String;
      Navigator.of(context).pop();
      showtheDialog(context, 'Error', message);
    }
  } catch (e) {
    Navigator.of(context).pop();
    showtheDialog(context, 'Error', e.toString());
    throw ServerException(message: e.toString(), statusCode: 1);
  }

  // Show an alert to the user if there is no response in the data or the status code is not 200
  // ignore: use_build_context_synchronously
  // showtheDialog(context, 'Error', 'Something went wrong');
}
