import 'package:flutter/material.dart';


class InfoCard extends StatelessWidget{
    final String text;
    final IconData icon;
    Function onPressed;

    InfoCard({@required this.text, @required this.icon, this.onPressed});

    @override
  Widget build(BuildContext context){
    return GestureDetector(
              onTap: onPressed,
              child: Card(
                //color:Colors.cyan[800],
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.cyan[800], width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin:EdgeInsets.symmetric(vertical:10.0,horizontal:20.0),
                child: ListTile(
                  leading: Icon(
                    icon,
                    color: Colors.cyan[800],
                    
                  ),
                  title: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Source San Pro',
                      fontSize: 18.0,
                      color: Colors.black,

                    ),

                  )
                ),
              ),
            );
  }
}