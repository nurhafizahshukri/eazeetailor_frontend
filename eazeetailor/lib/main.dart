import 'package:flutter/material.dart';


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
    
  ));
}

