import 'package:eazeetailor/Constant/Constant.dart';
import 'package:eazeetailor/OrderForm/KurungKedah.dart';
import 'package:eazeetailor/Screens/BookingScreen.dart';
import 'package:eazeetailor/Screens/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eazeetailor/OrderForm/Kebarung.dart';
import 'package:eazeetailor/OrderForm/Jubah.dart';
//import 'package:flushbar/flushbar.dart';



class HomeScreen extends StatefulWidget {
  
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
    Container(color: Colors.green, child: Center(child: Text('ORDER'))),
    AppointmentAction(),
    Container(color: Colors.green, child: Center(child: Text('SIZE'))),
    ProfileAction(),
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
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
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
            title: Text('Appointment Status',
                    style: TextStyle(
                      fontSize: 18,
                    ),),
            subtitle: Text('Your booking appoinment was rejected',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
            onTap: () {
              AppointmentAction();
            },
          ),
          ListTile(
            title: Text('Order Submitted',
                    style: TextStyle(
                      fontSize: 18,
                    ),),
            subtitle: Text('Your order have been submitted',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
            onTap: () {
              
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
        "EAZEE TAILOR"),
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
          title: Text('ORDER'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_contact_calendar),
          title: Text('BOOKING'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          title: Text('SIZING'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('PROFILE'),
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
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              
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






