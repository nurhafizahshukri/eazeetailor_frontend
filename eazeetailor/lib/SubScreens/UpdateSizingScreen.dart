import 'package:eazeetailor/Constant/Constant.dart';
import 'package:eazeetailor/models/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class UpdateSizeScreen extends StatefulWidget {

  final Members memberSize;

  UpdateSizeScreen(this.memberSize);

  @override
  _UpdateSizeScreenState createState() => _UpdateSizeScreenState();
}

class _UpdateSizeScreenState extends State<UpdateSizeScreen> {
  void _doNothing() {}
  
  bool keyboardOpen = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() => keyboardOpen = visible);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          IconButton(
                              icon: new Icon(Icons.power_settings_new),
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
                              }),
                        ],
                      ),
      body: Center(
        child: ListView(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Update ' +widget.memberSize.name +' Size',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    ),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 260,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/measurement.jpg'),
                fit: BoxFit.scaleDown,
                ),
              border: Border.all(
              color: Colors.cyan[900],
              width: 2,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Row(children: <Widget>[
              Text('Sleeve Length (in cm) :',
                style: TextStyle(fontSize: 20),),
              Expanded(
                child: Form(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new TextFormField(
                    initialValue: widget.memberSize.sizes.sleeve.toString(),
                    textAlign: TextAlign.center,
                    autofocus: false,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) {
                      widget.memberSize.sizes.sleeve = double.parse(value);
                    },
                  ),
          ),
          ),
        ),
      ],)
    ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Row(children: <Widget>[
              Text('Chest Length (in cm) :',
                style: TextStyle(fontSize: 20),),
              Expanded(
                child: Form(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new TextFormField(
                    initialValue: widget.memberSize.sizes.chest.toString(),
                    textAlign: TextAlign.center,
                    autofocus: false,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) {
                      widget.memberSize.sizes.chest = double.parse(value);
                    },
                  ),
          ),
          ),
        ),
      ],)
    ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Row(children: <Widget>[
              Text('Body Length (in cm) :',
                style: TextStyle(fontSize: 20),),
              Expanded(
                child: Form(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new TextFormField(
                      initialValue: widget.memberSize.sizes.body.toString(),
                      textAlign: TextAlign.center,
                      autofocus: false,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onChanged: (String value) {
                        widget.memberSize.sizes.body = double.parse(value);
                    },
                  ),
          ),
          ),
        ),
      ],)
    ),
        ],
        ),
        
      ),

      floatingActionButton: keyboardOpen ? SizedBox() : Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
            heroTag: null,
            label: Text('Update'),
            backgroundColor: Colors.cyan[800],
            icon: Icon(Icons.check_circle),
            onPressed: () => Navigator.pop(context, widget.memberSize)),
          FloatingActionButton.extended(
            heroTag: null,
            label: Text('Cancel'),
            backgroundColor: Colors.cyan[800],
            icon: Icon(Icons.cancel),
            onPressed: () => Navigator.pop(context, null)),
        ],
      ),
                  );
                }
}

 