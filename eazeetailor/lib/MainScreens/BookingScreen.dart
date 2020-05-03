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
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: ListView.separated(
          itemBuilder: (context, index) 
          => ListTile(
              leading: Icon(Icons.note),
              title: Text('Appointment ${index + 1}'),
              subtitle: Wrap(
                children: <Widget>[
                  Container(),
                  Text( 'Date:'+' '+ widget.apptDetails[index].date.toString() + 
                        '\nTime:' + ' '+ widget.apptDetails[index].time.toString(),),
                ],
              ),
              
              trailing: Text('Delete',
                style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
          separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemCount: widget.apptDetails.length),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
              icon: Icon(Icons.add),
              backgroundColor: Colors.cyan,
              label: Text('Add'),
              onPressed: null)
        ],
      ),
    );
  }
}