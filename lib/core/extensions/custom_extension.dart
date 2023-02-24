// coverage:ignore-file
import 'package:kamran/core/errors/failures.dart';

extension FailureMessage on Failure {
  String get message {
    switch (runtimeType) {
      case ServerFailure:
        return (this as ServerFailure).message ??
            'UNKNOWN ERROR: Error Occurred';
      default:
        return 'UNKNOWN ERROR: Error Occurred';
    }
  }

  String get statusCode {
    switch (runtimeType) {
      case CacheFailure:
        return 100.toString();
      case ServerFailure:
        return (this as ServerFailure).statusCode.toString();
      default:
        return 400.toString();
    }
  }
}
