// coverage:ignore-file
import 'package:flutter/cupertino.dart';

class Controller {
  Controller({required this.controller, this.isUsed = false});

  TextEditingController controller;
  bool isUsed;
}
