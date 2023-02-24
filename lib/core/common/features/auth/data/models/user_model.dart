// coverage:ignore-file
import 'dart:convert';

import 'package:kamran/core/common/features/auth/domain/entities/user.dart';
import 'package:kamran/core/typedef/typedefs.dart';

// TODO(copyWith): Add copyWith method
class UserModel extends User {
    const UserModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.password,
    required super.uid,
    super.phone,
    super.role,
    super.image,
    super.shopId,
    super.refreshToken,
    super.accessToken,
  });

  factory UserModel.fromJson(String json) {
    return UserModel.fromMap(jsonDecode(json) as DataMap);
  }

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          userId: map['userId'] as String,
          name: map['name'] as String,
          password: map['password'] as String,
          uid: map['uid'] as String,
          phone: map['phone'] as String?,
          role: map['type'] as String,
          image: map['image'] as String?,
          shopId: map['shopId'] as String?,
        );

  DataMap toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'password': password,
      'uid': uid,
      'phone': phone,
      'type': role,
      'image': image,
      'shopId': shopId,
    };
  }

  // copyWith method
  UserModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? password,
    String? uid,
    String? phone,
    String? role,
    String? image,
    String? shopId,
  }) {
    return UserModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      image: image ?? this.image,
      shopId: shopId ?? this.shopId,
    );
  }

  String toJson() => jsonEncode(toMap());
}
