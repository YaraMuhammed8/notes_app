import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notes_app/components/navigation_functions.dart';
import 'package:notes_app/services/local/shared_preferences/cache_helper.dart';
import 'package:notes_app/views/home_screen.dart';
import 'package:notes_app/views/login_screen.dart';

import 'components/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Widget nextScreen;
    dynamic token = CacheHelper.getData(key: "token");
    if (token == null) {
      nextScreen = LoginScreen();
    } else {
      nextScreen = HomeScreen();
    }
    Timer(
      const Duration(seconds: 3),
      () => navigateWithoutBack(context, nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/notes.png",
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
              const AppLogo(),
            ],
          ),
        ),
      ),
    );
  }
}