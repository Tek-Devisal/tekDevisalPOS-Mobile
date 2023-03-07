import 'package:tekDevisalPOS/core/typedef/typedefs.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  FunctionalFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();
  FunctionalFuture<Type> call();
}
