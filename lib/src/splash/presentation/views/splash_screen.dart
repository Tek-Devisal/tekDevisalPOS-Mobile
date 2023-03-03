import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kamran/src/dashboard/presentation/views/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/common/features/auth/presentation/views/SignIn.dart';
import '../../../../core/common/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const id = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Timer? timer;
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    timer = Timer(const Duration(seconds: 4), () async {
      // coverage:ignore-start
      Navigator.pushReplacementNamed(
          context,
          await getFromSharedPreference() != null
              ? HomePage.id
              : SignInPage.id); // coverage:ignore-end
    });
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceInOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SlideTransition(
        position: animation,
        child: const Logo(),
      ),
    );
  }

  getFromSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }
}
