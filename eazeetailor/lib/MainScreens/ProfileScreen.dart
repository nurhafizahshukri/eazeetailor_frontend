import 'package:eazeetailor/SubScreens/SettingScreen.dart';
import 'package:eazeetailor/models/class.dart';
import 'package:eazeetailor/services/data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileAction extends StatelessWidget {
  
  List<User> _user;
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: dataService.getUserList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _user = snapshot.data;
          return _buildScreen(context);
        }
        return _buildFetchingDataScreen();
      });
  }

  Scaffold _buildScreen(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 30, top: 1),
              child: Text(
                'PROFILE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ),
              
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              Text(
                '',
                style: TextStyle(
                  fontSize: 0.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '',
                style: TextStyle(
                  fontSize: 5.0,
                  color: Colors.teal[50],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans Pro',
                ),
              ),
              SizedBox(
                height: 15,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              InfoCard(
                text: _user[0].name,
                icon: Icons.perm_identity,
                onPressed: () {
                  print('username');
                },
              ),
              InfoCard(
                text: _user[0].address,
                icon: Icons.location_city,
                onPressed: () {
                  print('location');
                },
              ),
              InfoCard(
                text: _user[0].phone,
                icon: Icons.phone,
               
              ),
              InfoCard(
                text: _user[0].email,
                icon: Icons.email,
               
              ),
            ],
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton.extended(
              label: Text('SETTINGS'),
              icon: Icon(Icons.settings),
              backgroundColor: Colors.teal,
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => SettingsAction())
                  );
              })
        ]));
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching user... Please wait'),
          ],
        ),
      ),
    );
  }
}


class InfoCard extends StatelessWidget{
    final String text;
    final IconData icon;
    Function onPressed;

    InfoCard({@required this.text, @required this.icon, this.onPressed});

    @override
  Widget build(BuildContext context){
    return GestureDetector(
              onTap: onPressed,
              child: Card(
                //color:Colors.cyan[800],
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.cyan[800], width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin:EdgeInsets.symmetric(vertical:10.0,horizontal:20.0),
                child: ListTile(
                  leading: Icon(
                    icon,
                    color: Colors.cyan[800],
                    
                  ),
                  title: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Source San Pro',
                      fontSize: 18.0,
                      color: Colors.black,

                    ),

                  )
                ),
              ),
            );
  }
}