import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
   List apptDetails;

  BookingScreen(this.apptDetails);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  

  @override
  Widget build(BuildContext context) {
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
           itemCount: widget.apptDetails.length,
           separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemBuilder: (context, index) {
             return new Dismissible(key: Key(widget.apptDetails[index].toString()),
                background: Container(
                  color: Colors.red,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(Icons.delete, color: Colors.white)
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction){
                  widget.apptDetails.removeAt(index);
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
                  Text( 'Date:'+' '+ widget.apptDetails[index].date.toString() + 
                        '\nTime:' + ' '+ widget.apptDetails[index].time.toString(),),
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
}