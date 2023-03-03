// coverage:ignore-file
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kamran/core/common/features/auth/presentation/views/SignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Failure extends Equatable {
  const Failure({this.properties = const []});

  final List<dynamic> properties;

  @override
  List<dynamic> get props => properties;
}

class CacheFailure extends Failure {}

class ServerFailure extends Failure {
  ServerFailure({this.message, this.statusCode})
      : super(
          properties: message != null && statusCode != null
              ? [message, statusCode]
              : [],
        );
  final String? message;
  final int? statusCode;
}

class MiddleServerException {
  MiddleServerException(
      {required this.context, this.message, required this.prefs}) {
    if (message.toString().contains("Invalid Token")) {
      prefs.clear();
      Navigator.pushReplacementNamed(context, SignInPage.id);
      Fluttertoast.showToast(msg: "You have been logged out");
    }
  }
  final BuildContext context;
  final String? message;
  SharedPreferences prefs;
}
