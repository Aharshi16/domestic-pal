import 'package:domestic_pal/models/user.dart';
import 'package:flutter/material.dart';

class Hire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Do you want to:',
            style: TextStyle(fontSize: 30.0),
          ),
          SizedBox(height: 20.0),
          FlatButton(
            onPressed: () {
              // change category to customer
              
            },
            minWidth: 115.0,
            color: Colors.red[800],
            child: Text(
              'Hire',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          FlatButton(
            onPressed: () {},
            minWidth: 60.0,
            color: Colors.amber[800],
            child: Text(
              'Get hired',
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    ));
  }
}

