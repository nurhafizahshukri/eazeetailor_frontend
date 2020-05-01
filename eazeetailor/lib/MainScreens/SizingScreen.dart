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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                              0, 15, 0, 0),
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
                                  child: ButtonBar(children: <Widget>[
                                FlatButton(
                                    child: Text(
                                      'Update',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    onPressed: () => _navigate(index))
                              ]))
                            ])),
                    onTap: () => _navigate(index),
                    onLongPress: () {
                      setState(() {
                        widget.memberSize.removeAt(index);
                      });
                    },
                  ),
                );
              })),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
              heroTag: null,
              label: Text('Add'),
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.add),
              onPressed: null)
        ],
      ),
    );
  }
}
