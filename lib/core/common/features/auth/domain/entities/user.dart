// coverage:ignore-file
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.userId,
    required this.name,
    required this.password,
    required this.uid,
    this.phone,
    this.role,
    this.image,
    this.shopId,
    this.refreshToken,
    this.accessToken,
  });

  final String id;
  final String userId;
  final String? name;
  final String? password;
  final String? role;
  final String? refreshToken;
  final String? accessToken;
  final String? image;
  final String uid;
  final String? phone;
  final String? shopId;

  @override
  List<dynamic> get props => [
        name,
        uid,
        role,
        id,
        userId,
      ];
}
