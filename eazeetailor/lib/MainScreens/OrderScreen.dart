import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/class.dart';


class OrderScreen extends StatefulWidget {
  final List<Order> orderDetails;

  OrderScreen(this.orderDetails);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) 
          => ListTile(
              leading: Icon(Icons.note),
              title: Text('Order ${[index]}'),
              subtitle: Text('Design: \nSize: \nFabric: ')
              ),
          separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemCount: widget.orderDetails.length),
      ),

      floatingActionButton: Row(
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
