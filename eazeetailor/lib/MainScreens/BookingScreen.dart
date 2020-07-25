import 'package:eazeetailor/models/class.dart';
import 'package:eazeetailor/services/data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
   

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<Appointment> _appointment;

  @override
  Widget build(BuildContext context) {
     return FutureBuilder<List<Appointment>>(
      future: dataService.getAppointmentList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _appointment = snapshot.data;
          return _buildScreen();
        }
        return _buildFetchingDataScreen();
      });
  }

Scaffold _buildScreen() {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        brightness: Brightness.light,
        // backgroundColor: Color(0xFF0097A7),
        backgroundColor: Colors.cyan[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
              MediaQuery.of(context).size.width, 100.0)
          )
        ),
        title: Text(
          'APPOINTMENT LIST',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        
        padding: EdgeInsets.only(top: 15),
        child: ListView.separated(
           itemCount: _appointment.length,
           separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemBuilder: (context, index) {
             return new Dismissible(
               key: Key(_appointment[index].toString()),
                background: Container(
                  color: Colors.red,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(Icons.delete, color: Colors.white)
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) async {
                  await dataService.deleteAppointment(
                    id: _appointment[index].id.toString());
                    setState(() => _appointment.removeAt(index));
                  Scaffold.of(context).showSnackBar(
                    new SnackBar(
                      content : new Text("Appointment has been deleted"),
                      backgroundColor: Colors.teal,
                    ));
                },
                child:  ListTile(
                leading: Icon(Icons.note),
                title: Text('Appointment ${index + 1}'),
                subtitle: Wrap(
                children: <Widget>[
                  Container(),
                  Text( 'Date:'+' '+ _appointment[index].date + 
                        '\nTime:' + ' '+ _appointment[index].time,),
                ],
              ),
              
              trailing: Text('< Delete',
                style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: Colors.cyan[900]),
                ),
              ));
          }
        ),
      ),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching Appointments... Please wait'),
          ],
        ),
      ),
    );
  }
}