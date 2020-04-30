import 'package:flutter/material.dart';
import 'package:eazeetailor/Constant/Constant.dart';
import 'package:eazeetailor/MainScreens/SplashScreen.dart';
import 'package:eazeetailor/MainScreens/LoginScreen.dart';
import 'package:eazeetailor/MainScreens/SignUpScreen.dart';

main() {

  runApp(new MaterialApp(
    title: 'Eazee Tailor',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      accentColor: Colors.black,
      primaryColor: Colors.black,
      primaryColorDark: Colors.black

    ),
    home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
      LOGIN_SCREEN: (BuildContext context) => new LogInScreen(),
      SIGN_UP_SCREEN: (BuildContext context) => new SignUpScreen(),
      ANIMATED_SPLASH: (BuildContext context) => new SplashScreen()
      },
  ));
}

