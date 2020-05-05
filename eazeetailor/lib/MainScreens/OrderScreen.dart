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
          itemCount: widget.orderDetails.length,
          separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemBuilder: (context, index) {
            return new Dismissible(key: Key(widget.orderDetails[index].toString()),
            onDismissed: (direction){
              widget.orderDetails.removeAt(index);
              Scaffold.of(context).showSnackBar(
                new SnackBar(
                content : new Text("Order has deleted"),
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
                   
                   //Text( widget.orderDetails[index].design.toString(),),
                   //Text( widget.orderDetails[index].size.toString(),),
                   // Text( widget.orderDetails[index].fabric.toString(),),
                 ]
               ),
               trailing: Text(' Swipe to Delete',
                style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: Colors.cyan[900]),
                ),
             ));
          }
        
          
         
          
        ),
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
