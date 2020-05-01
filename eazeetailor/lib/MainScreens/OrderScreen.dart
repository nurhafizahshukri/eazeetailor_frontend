import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OrderScreen extends StatefulWidget {
   List orderDetails;

  OrderScreen(this.orderDetails);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: ListView.separated(
          itemBuilder: (context, index) 
          => ListTile(
              leading: Icon(Icons.note),
              title: Text('Order ${index + 1}'),
              subtitle: Wrap(
                children: <Widget>[
                  Container(),
                  Text( widget.orderDetails[index].design.toString(),),
                  Text(' , '  + widget.orderDetails[index].size.toString(),),
                  Text(' , ' + widget.orderDetails[index].fabric.toString(),)
                ],
              ),
              
              trailing: Text('Delete',
                style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
          separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemCount: widget.orderDetails.length),
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
