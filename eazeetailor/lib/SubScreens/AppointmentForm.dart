import 'package:eazeetailor/Constant/Constant.dart';
import 'package:eazeetailor/models/class.dart';
import 'package:eazeetailor/services/data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:eazeetailor/MainScreens/HomeScreen.dart';

class AppointmentScreen extends StatefulWidget {
  
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int photoIndex=0;
  String _date, _time;
  List<Appointment> _appointment =List<Appointment>();
  GlobalKey<FormState> _formKey;

  

  final newformat = DateFormat("yyyy-MM-dd");
  final format1 = DateFormat("HH:mm");
  void _doNothing() {}
   @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
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
                  Navigator.of(context).pushReplacementNamed(AUTH_SCREEN);
                }),
          ],
        
        ),
        body: Center( 
        //child: Column(
          child: Form(
            key: _formKey,
            child: ListView(
              //padding: EdgeInsets.all(50),
              children: <Widget> [
                Padding(padding: EdgeInsets.only(top: 20.0),),
                Text('APPOINTMENT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                Padding(padding: EdgeInsets.only(top: 30.0),),
                Text('Appointment Date',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),),
                Padding(padding: EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 15),
                  child: DateTimeField(
                    onChanged: (currentValue) => _date = newformat.format(currentValue),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                      labelText: 'Date Format: (${newformat.pattern})'
                    ),
                    format: newformat,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100)
                        );
                    },
                  ),
                ),

                Text('Appointment Time',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),),
                Padding(padding: EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 15),
                  child:DateTimeField(
                    onChanged: (currentValue) => _time = format1.format(currentValue),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                      labelText: 'Time Format: (${format1.pattern})'
                    ),
                    format: format1,
                    onShowPicker: (context, currentValue) async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.convert(time);
                    },
                  ), ),
                  
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen(),
                          ),
                        );
                    },
                    ),
                  RaisedButton(
                    color: Colors.cyan,
                    onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      final newApt = await dataService.createAppointment(
                      appointments: Appointment(date: _date , time: _time),);
                      setState(() => _appointment.add(newApt));
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }
                  },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 20)
                      ),
                  ),
                ],)
               
              ]),
          ),     ),  
        );
        
  }
}
