// coverage:ignore-file
// ignore_for_file: dead_code
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kamran/core/common/features/auth/data/models/user_model.dart';
import 'package:kamran/core/components/server.dart';
import 'package:kamran/core/errors/exceptions.dart';
import 'package:kamran/core/typedef/typedefs.dart';
import 'package:kamran/src/dashboard/presentation/views/HomePage.dart';
import 'package:kamran/src/dashboard/widgets/alertDialog.dart';
import 'package:kamran/src/dashboard/widgets/loader_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signInUser(
    BuildContext context, String email, String password) async {
  showLoaderDialog(context);
  final prefs = await SharedPreferences.getInstance();
  final url = Uri.parse(Server.instance.authority + '/api/v1/user/login');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': password});
  try {
    final response = await http.post(url, headers: headers, body: body);
    // print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final accessToken = data['accessToken'] as String?;
      if (accessToken != null) {
        prefs.setString('email', data['email'] as String);
        prefs.setString('accessToken', accessToken);
        prefs.setString('refreshToken', data['refreshToken'] as String);
        prefs.setString('id', data['id'] as String);
        prefs.setString('usertype', data['usertype'] as String);
        prefs.setString('name', data['name'] as String);
        prefs.setString('shop_name', data['shop_name'] as String);
        prefs.setString('shop_id', data['shop_id'] as String);
        Navigator.pushReplacementNamed(context, HomePage.id);
        return;
      }
      // print(data['message'] as String);
    } else {
      // ignore: use_build_context_synchronously
      showtheDialog(context, "Error", "Something went wrong");
      // print('Failed to sign in. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    // ignore: use_build_context_synchronously
    showtheDialog(context, "Error", "Something went wrong");
    throw ServerException(message: e.toString(), statusCode: 1);
  }
}
