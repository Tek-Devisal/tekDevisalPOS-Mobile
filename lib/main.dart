import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tekDevisalPOS/app/view/app.dart';
import 'package:tekDevisalPOS/bootstrap.dart';
import 'package:tekDevisalPOS/core/utils/constants.dart';
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
  Server(environment: Environment.PROD);
  await bootstrap(
    () => Provider<Environment>.value(
      value: Environment.PROD,
      child: const App(),
    ),
  );
}
