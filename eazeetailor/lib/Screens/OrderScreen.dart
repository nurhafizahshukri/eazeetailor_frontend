

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentAction extends StatelessWidget {
  final List<String> items = new List<String>.generate(1, (i) => "${i + 1}");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        padding: EdgeInsets.only(top: 20),
          itemCount: items.length,
          itemBuilder: (context, int index) {
            return new Dismissible(
                key: new Key(items[index]),
                onDismissed: (direction) {
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: new Text("Appointment have been deleted"),
                  ));
                },
                background: new Container(color: Colors.red),
                child: new ListTile(
                  leading: Icon(Icons.event_note),
                  title: Text('Appointment ${items[index]}'),
                  subtitle: Text('Oder: Kebarung \nSize: XS \nFabric Type: Songket'),
                  trailing: Text(
                    'Rejected',
                    style: TextStyle(
                        color: Colors.red[700], fontWeight: FontWeight.bold),
                  ),
                ));
          }),
    );
  }
}