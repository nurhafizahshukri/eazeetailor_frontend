import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, int index) => ListTile(
              leading: Icon(Icons.note),
              title: Text('Order 1'),
              subtitle: Text('Design: \nSize: \nFabric: ')),
          separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemCount: 1),
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
