import 'package:eazeetailor/models/class.dart';
import 'package:eazeetailor/services/data_service.dart';
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
  // List<Members> _members;
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
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF0097A7),
        title: Text(
          'Update ' +widget.memberSize.name +' Size',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
                  child: Form(
                    child: TextFormField(
                      initialValue: widget.memberSize.name,
                      textAlign: TextAlign.center,
                      autofocus: false,
                      onChanged: (String value) {
                      widget.memberSize.name = value;
                    },
                    decoration: InputDecoration(
                      helperText: 'Add a name for this size measurement.',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                    ),
                ),
                  ),
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
                    initialValue: widget.memberSize.sleeve.toString(),
                    textAlign: TextAlign.center,
                    autofocus: false,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) {
                      widget.memberSize.sleeve = double.parse(value);
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
                    initialValue: widget.memberSize.chest.toString(),
                    textAlign: TextAlign.center,
                    autofocus: false,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) {
                      widget.memberSize.chest = double.parse(value);
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
                      initialValue: widget.memberSize.body.toString(),
                      textAlign: TextAlign.center,
                      autofocus: false,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onChanged: (String value) {
                        widget.memberSize.body = double.parse(value);
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
            onPressed: () async {
          final updateSize = await dataService.updatesize(
            id: widget.memberSize.id.toString(),
            members: Members(name: widget.memberSize.name, sleeve: widget.memberSize.sleeve, chest: widget.memberSize.chest ,body: widget.memberSize.body ),
          ); 
          Navigator.pop(context, updateSize);
        },),
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

 