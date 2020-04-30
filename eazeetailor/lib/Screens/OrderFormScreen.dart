import 'package:eazeetailor/Constant/Constant.dart';
import 'package:eazeetailor/Screens/HomeScreen.dart';
import 'package:eazeetailor/models/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazeetailor/Screens/AppointmentForm.dart';

class OrderForm extends StatefulWidget {

  final OutfitDetails outfits;

  OrderForm(this.outfits);
  
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  void _doNothing() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xFF0097A7),
          centerTitle: true,
          title: new Text("Eazee Tailor"),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.search),
              onPressed: _doNothing,
            ),
            IconButton(
                icon: new Icon(Icons.power_settings_new),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
                }),
          ],
        ),
        body: Center( 
        //child: Column(
          child: ListView(
            //padding: EdgeInsets.all(50),
            children: <Widget> [
              Padding(padding: EdgeInsets.only(top: 20.0),),
              Text(widget.outfits.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0),),
                CarouselSlider(
                  height: 300.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 1,
                  items: widget.outfits.imgurl.map((item) => Container(
                  child: Center(
                    child: Image.asset(item, fit: BoxFit.cover, width: 1000)
                  ),
                  )).toList(),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      color: Colors.white,
                  ),
                  child: Center(
                    child: Text(widget.outfits.desc,
                      textAlign: TextAlign.center,
                    )
                  ),
                ),
              Text('Size :', textAlign: TextAlign.center,),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonPadding: EdgeInsets.zero,
                children: <Widget>[
                  //Padding(padding: EdgeInsets.all(0)),
                  Text('XS'),
                  Radio(
                    value: 1, 
                    groupValue: selectedRadio, 
                    activeColor: Colors.green ,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    }),
                    Text('S'),
                  Radio(
                    value: 2, 
                    groupValue: selectedRadio, 
                    activeColor: Colors.green ,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    }),
                    Text('M'),
                  Radio(
                    value: 3, 
                    groupValue: selectedRadio, 
                    activeColor: Colors.green ,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    }),
                    Text('L'),
                  Radio(
                    value: 4, 
                    groupValue: selectedRadio, 
                    activeColor: Colors.green ,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    }),
                    Text('XL'),
                  Radio(
                    value: 5, 
                    groupValue: selectedRadio, 
                    activeColor: Colors.green ,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    }),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Fabric type',
                      hintText: 'Fabric type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3)
                      )
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Remarks',
                      hintText: 'Remarks',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3)
                      )
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen(),
                        ),
                      );
                  },
                  ),
                RaisedButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AppointmentScreen(),
                        ),
                      );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 20)
                    ),
                ),
              ],) 
               
              //)
              
            ]
          
        ),
          //),
        ),
        );
        
  }
}

