// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tekDevisalPOS/core/services/router.imports.dart';
import 'package:tekDevisalPOS/src/splash/presentation/views/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  // TODO(FLAVOUR): should listen to the dummy data only in DEV mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TekDevisalPOS',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        // scaffoldBackgroundColor: Colours.backgroundGreyColour,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
        // fontFamily: Fonts.urbanist,
      ),
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: SplashScreen.id,
      onGenerateRoute: generateRoute,
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(

//       home: MyHomePage(),
//     );
//   }
// }
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const SignInPage();
//   }
// }