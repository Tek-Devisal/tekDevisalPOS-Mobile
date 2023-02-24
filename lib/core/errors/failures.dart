// coverage:ignore-file
import 'package:equatable/equatable.dart';

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
