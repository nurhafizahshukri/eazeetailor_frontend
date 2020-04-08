import 'package:eazeetailor/Constant/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KurungKedah extends StatelessWidget {
 
  void _doNothing() {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xFF0097A7),
          centerTitle: true,
          title: new Text("Eazee Tailor"),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.search),
              onPressed: _doNothing,
            ),
            // IconButton(
            //   icon: new Icon(Icons.notifications_active),
            //   onPressed: _doNothing,
            // ),
            IconButton(
                icon: new Icon(Icons.power_settings_new),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
                }),
          ],
        ),
        body: Container(color: Colors.purple, child: Center(child: Text('Kurung Kedah'))),
        
        ),
    );
  }
}

