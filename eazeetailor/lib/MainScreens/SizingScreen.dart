import 'package:eazeetailor/SubScreens/updateSizingScreen.dart';
import 'package:eazeetailor/models/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizingScreen extends StatefulWidget {
  final List<Members> memberSize;

  SizingScreen(this.memberSize);

  @override
  _SizingScreenState createState() => _SizingScreenState();
}

class _SizingScreenState extends State<SizingScreen> {
  
  void _navigate(int index) async {
    Members returnData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            UpdateSizeScreen(Members.copy(widget.memberSize[index])),
      ),
    );

    if (returnData != null) {
      setState(() => widget.memberSize[index] = returnData);
    }
  }

  void _removeSizeItem(int index) {
  setState(() => widget.memberSize.removeAt(index));

  Scaffold.of(context).showSnackBar(
                new SnackBar(
                content : new Text("Size has been deleted"),
                backgroundColor: Colors.teal,
                ));
  }

  void _promptRemoveSizeItem(int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('Delete this size measurement?'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('CANCEL'),
            onPressed: () => Navigator.of(context).pop()
          ),
          new FlatButton(
            child: new Text('DELETE'),
            onPressed: () {
              _removeSizeItem(index);
              Navigator.of(context).pop();
            }
          )
        ]
      );
    }
  );
}

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
          'SIZE LIST',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: ListView.builder(
              itemCount: widget.memberSize.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(15.0, 16.0, 15.0, 0),
                  child: InkWell(
                    child: Container(
                        height: 140.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 140,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            widget.memberSize[index].name
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 15, 180, 0),
                                          child:
                                              //for (var i in text),
                                              Text(
                                            'Body Length : ' +
                                                widget.memberSize[index].sizes
                                                    .body
                                                    .toString() +
                                                '\nSleeve Length : ' +
                                                widget.memberSize[index].sizes
                                                    .sleeve
                                                    .toString() +
                                                '\nChest : ' +
                                                widget.memberSize[index].sizes
                                                    .chest
                                                    .toString(),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Expanded(
                                  child: Icon(Icons.arrow_forward_ios))
                            ])),
                    onTap: () => _navigate(index),
                    onLongPress: () => _promptRemoveSizeItem(index)
                  ),
                );
              })),
    );
  }
}
