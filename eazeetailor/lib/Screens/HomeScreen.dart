import 'package:eazeetailor/Constant/Constant.dart';
import 'package:eazeetailor/OrderForm/KurungKedah.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:eazeetailor/info_card.dart';
import 'package:eazeetailor/OrderForm/Kebarung.dart';
import 'package:eazeetailor/OrderForm/Jubah.dart';

const url = 'http://github.com/nurhafizahshukri/projectMAP.git';
const email = 'eazeetailor@gmail.com';
const phone = '+60 14 156 1631';
const location = 'Johor, Malaysia';
const username = 'Taylor Swift';
const PasswordCredential = 'tswift';

class HomeScreen extends StatefulWidget {
  var userName;

  // HomeScreen(this.userName);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _doNothing() {}
  // String userName;
  int _currentIndex = 0;

  final tabs = [
    HomeAction(),
    AppointmentAction(),
    ProfileAction(),
    SettingsAction()
    //Container(color: Colors.green, child: Center(child: Text('Profile'))),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: buildDrawer(context),
        appBar: buildAppBar(context),
        body: tabs[_currentIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Notification',
                  style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
          ),
          ListTile(
            title: Text('Notification 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Notification 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
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
      title: new Text(
        "EAZEE TAILOR",
        style: GoogleFonts.pacifico(
            //textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
            ),
      ),
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

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('HOME'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          title: Text('VIEW'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('PROFILE'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('SETTINGS'),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      selectedItemColor: Colors.cyan[900],
    );
  }
}

class HomeAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverFixedExtentList(
                itemExtent: 250,
                delegate: SliverChildListDelegate([
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/images/one.jpg'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.4),
                                Colors.black.withOpacity(.2),
                              ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Fashion Sale",
                            style: GoogleFonts.lobster(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Center(
                                child: Text(
                              "Book Your Appointment Now",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              SliverFixedExtentList(
                itemExtent: 30,
                delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 30,
                  ),
                ]),
              ),
              SliverGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/kurungkedah.jpg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  //margin: EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(10),
                                      color: Colors.yellow[100]),
                                  child: Center(
                                      child: Text(
                                    "Kurung Kedah",
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KurungKedah(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/jubah.jpeg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  //margin: EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(10),
                                      color: Colors.pink[100]),
                                  child: Center(
                                      child: Text(
                                    "Jubah",
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Jubah(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/kurungsongket.jpg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  //margin: EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[200]),
                                  child: Center(
                                      child: Text(
                                    "Kurung Songket",
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KurungKedah(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/kurungpahang.jpg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  //margin: EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(10),
                                      color: Colors.amber[50]),
                                  child: Center(
                                      child: Text(
                                    "Kurung Pahang",
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KurungKedah(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/kebarung.jpg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  //margin: EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(10),
                                      color: Colors.orange[100]),
                                  child: Center(
                                      child: Text(
                                    "Kebarung",
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Kebarung(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/kurungcotton.jpg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  //margin: EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(10),
                                      color: Colors.lightBlue[200]),
                                  child: Center(
                                      child: Text(
                                    "Kurung Cotton",
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KurungKedah(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/jubahmoden.jpg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  //margin: EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(10),
                                      color: Colors.pink[100]),
                                  child: Center(
                                      child: Text(
                                    "Jubah Moden",
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KurungKedah(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/kurungmoden.jpg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  //margin: EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(10),
                                      color: Colors.brown[100]),
                                  child: Center(
                                      child: Text(
                                    "Kurung Moden",
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KurungKedah(),
                          ),
                        );
                      },
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentAction extends StatelessWidget {
  final List<String> items = new List<String>.generate(5, (i) => "${i + 1}");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, int index) {
            return new Dismissible(
                key: new Key(items[index]),
                onDismissed: (direction) {
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text("Appointment have been deleted"),
                  ));
                },
                background: new Container(color: Colors.red),
                child: new ListTile(
                  leading: Icon(Icons.event_note),
                  title: Text('Appointment ${items[index]}'),
                  subtitle: Text('Oder: Kurung Kedah | Size: XS'),
                  trailing: Text(
                    'Approved',
                    style: TextStyle(
                        color: Colors.green[700], fontWeight: FontWeight.bold),
                  ),
                ));
          }),
    );
  }
}

class ProfileAction extends StatelessWidget {
  void _doNothing() {}
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
              label: Text('Update'),
              backgroundColor: Colors.teal,
              onPressed: () {})
        ]));
  }
}

class SettingsAction extends StatefulWidget {
  @override
  _SettingsActionState createState() => _SettingsActionState();
}

class _SettingsActionState extends State<SettingsAction> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.teal[900]),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.cyan[800],
                  child: ListTile(
                    onTap: () {
                      //open edit profile
                    },
                    title: Text(
                      "Taylor Swift",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.cyan,
                        ),
                        title: Text("Change Password"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change password
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.language,
                          color: Colors.cyan,
                        ),
                        title: Text("Change Language"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change language
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Notifications Settings',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[900],
                  ),
                ),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.greenAccent[700],
                  contentPadding: const EdgeInsets.all(0),
                  value: _isSelected,
                  title: Text("Receive Notification"),
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSelected = newValue;
                    });
                  },
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
