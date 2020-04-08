import 'package:eazeetailor/Constant/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  var userName;

  HomeScreen(this.userName);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _doNothing() {}
  String userName;
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
      ),
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        leading: Builder(
          builder: (context) => IconButton(
                icon: new Icon(Icons.notifications_active),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
      ),
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFF0097A7),
        centerTitle: true,
        title: new Text("EAZEE TAILOR",
        style: GoogleFonts.pacifico(
        //textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
        ),),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search),
            onPressed: _doNothing,
          ),
          IconButton(
              icon: new Icon(Icons.power_settings_new),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
              }),
        ],
      );
  }
}



