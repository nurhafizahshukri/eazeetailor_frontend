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
          'ORDER LIST',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: ListView.separated(
          itemCount: widget.orderDetails.length,
          separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemBuilder: (context, index) {
            return new Dismissible(
              key: Key(widget.orderDetails[index].toString()),
              background: Container(
                  color: Colors.red,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(Icons.delete, color: Colors.white)
                ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction){
                widget.orderDetails.removeAt(index);
                Scaffold.of(context).showSnackBar(
                new SnackBar(
                content : new Text("Order has been deleted"),
                backgroundColor: Colors.teal,
                ));
              },
              child: ListTile(
               leading: Icon(Icons.note),
               title: Text('Order ${index + 1}'),
               subtitle: Wrap(
                 children: <Widget>[
                   Text( 
                     'Design:'+' '+ widget.orderDetails[index].design.toString() +
                     '\nSize:' + ' '+ widget.orderDetails[index].size.toString() +
                     '\nFabric:'+ ' '+ widget.orderDetails[index].fabric.toString(),
                   ),
                 ]
               ),
               trailing: Text(' < Delete',
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
