import 'package:flutter/material.dart';
import 'package:eazeetailor/Constant/Constant.dart';
import 'package:eazeetailor/MainScreens/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'MainScreens/auth_screen.dart';
import 'models/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Eazee Tailor',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          accentColor: Colors.black,
          primaryColor: Colors.black,
          primaryColorDark: Colors.black
  
        ),
        home: new SplashScreen(),
        routes: <String, WidgetBuilder>{
          AUTH_SCREEN: (BuildContext context) => new AuthScreen(),
          ANIMATED_SPLASH: (BuildContext context) => new SplashScreen()
        },
      ),
    );
  }
}

