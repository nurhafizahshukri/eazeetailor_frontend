import 'package:eazeetailor/Screens/SettingScreen.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:eazeetailor/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const url = 'http://github.com/nurhafizahshukri/projectMAP.git';
const email = 'eazeetailor@gmail.com';
const phone = '+60 14 156 1631';
const location = 'Johor, Malaysia';
const username = 'Taylor Swift';
const PasswordCredential = 'tswift';

class ProfileAction extends StatelessWidget {
 
  void _showDialog(BuildContext context, {String title, String msg}) {
    final dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        RaisedButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Close',
            style: TextStyle(color: Colors.black45),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (x) => dialog);
  }

  @override
  Widget build(BuildContext context) {
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
                text: username,
                icon: Icons.perm_identity,
                onPressed: () {
                  print('username');
                },
              ),
              InfoCard(
                text: location,
                icon: Icons.location_city,
                onPressed: () {
                  print('location');
                },
              ),
              InfoCard(
                text: phone,
                icon: Icons.phone,
                onPressed: () async {
                  String removeSpaceFromPhoneNumber =
                      phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                  final phoneCall = 'tel:$removeSpaceFromPhoneNumber';

                  if (await launcher.canLaunch(phoneCall)) {
                    await launcher.launch(phoneCall);
                  } else {
                    _showDialog(
                      context,
                      title: 'Sorry',
                      msg: 'Phone number can not be called. Please try again!',
                    );
                  }
                },
              ),
              InfoCard(
                text: email,
                icon: Icons.email,
                onPressed: () async {
                  if (await launcher.canLaunch(url)) {
                    await launcher.launch(url);
                  } else {
                    _showDialog(
                      context,
                      title: 'Sorry',
                      msg: 'Email can not be send. Please try again!',
                    );
                  }
                },
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
}