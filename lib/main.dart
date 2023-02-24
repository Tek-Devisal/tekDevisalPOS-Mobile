import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kamran/app/view/app.dart';
import 'package:kamran/bootstrap.dart';
import 'package:kamran/core/utils/constants.dart';
import 'package:kamran/screens/SignIn.dart';
import 'package:provider/provider.dart';

import 'core/components/server.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  Server(environment: Environment.DEV);
  await bootstrap(
    () => Provider<Environment>.value(
      value: Environment.DEV,
      child: const App(),
    ),
  );
}
