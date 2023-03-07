// coverage:ignore-file
import 'package:flutter/widgets.dart';
import 'package:tekDevisalPOS/core/common/features/auth/domain/entities/user.dart';

class UserController extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }
}
