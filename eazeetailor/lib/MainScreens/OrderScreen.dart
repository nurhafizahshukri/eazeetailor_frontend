import 'package:eazeetailor/models/class.dart';
import 'package:eazeetailor/services/data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class OrderScreen extends StatefulWidget {
 

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order> _order;  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
      future: dataService.getOrderList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _order = snapshot.data;
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
          'ORDER LIST',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: ListView.separated(
          itemCount: _order.length,
          separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemBuilder: (context, index) {
            return new Dismissible(
              key: Key(UniqueKey().toString()),
              background: Container(
                  color: Colors.red,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(Icons.delete, color: Colors.white)
                ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) async {
                await dataService.deleteOrder(
                    id: _order[index].id.toString());
                    setState(() => _order.removeAt(index));
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
                     'Design:'+' '+ _order[index].design.toString() +
                     '\nSize:' + ' '+ _order[index].size.toString() +
                     '\nFabric:'+ ' '+ _order[index].fabric.toString(),
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

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching Order... Please wait'),
          ],
        ),
      ),
    );
  }
}


