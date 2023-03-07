import 'package:dartz/dartz.dart';
import 'package:tekDevisalPOS/core/errors/failures.dart';

typedef DataMap = Map<String, dynamic>;
typedef Functional<T> = Either<Failure, T>;
typedef FunctionalFuture<T> = Future<Functional<T>>;
typedef FunctionalVoid = FunctionalFuture<void>;
