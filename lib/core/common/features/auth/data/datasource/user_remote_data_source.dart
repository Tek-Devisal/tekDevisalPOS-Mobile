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
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signInUser(
    BuildContext context, String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final url = Uri.parse(Server.instance.authority + '/api/v1/user/login');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': password});
  try {
    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      // print(data['accessToken']);
      if (data['accessToken'] != null) {
        prefs.setString('email', data['email']);
        prefs.setString('accessToken', data['accessToken']);
        prefs.setString('refreshToken', data['refreshToken']);
        prefs.setString('id', data['id']);
        prefs.setString('usertype', data['usertype']);
        prefs.setString('name', data['name']);
        prefs.setString('shop_name', data['shop_name']);
        Navigator.pushReplacementNamed(
          context,
          HomePage.id,
        );
        print('Login successful');
      } else {
        print(data['message']);
      }
    } else {
      print('Failed to sign in. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw ServerException(message: e.toString(), statusCode: 1);
  }
}
