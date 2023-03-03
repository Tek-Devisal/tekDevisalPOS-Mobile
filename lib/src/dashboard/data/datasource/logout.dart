import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kamran/core/common/features/auth/presentation/views/SignIn.dart';
import 'package:kamran/src/dashboard/widgets/loader_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

logout(BuildContext context) async {
  showLoaderDialog(context);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  Navigator.pushReplacementNamed(context, SignInPage.id);
  Fluttertoast.showToast(msg: "Logout successful");
}
