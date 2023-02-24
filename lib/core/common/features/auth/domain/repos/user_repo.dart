import 'package:kamran/core/common/features/auth/domain/entities/user.dart';
import 'package:kamran/core/typedef/typedefs.dart';


abstract class UserRepo {

  FunctionalFuture<User> signInUser({
    required String uid,
    required String password,
  });

}
