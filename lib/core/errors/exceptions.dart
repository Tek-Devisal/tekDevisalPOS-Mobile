import 'package:equatable/equatable.dart';

class CacheException implements Exception {}

class ServerException extends Equatable implements Exception {
  const ServerException({this.message, this.statusCode});

  final String? message;
  final int? statusCode;
// coverage:ignore-start
  @override
  List<Object?> get props => [message, statusCode];
  // coverage:ignore-end
}
