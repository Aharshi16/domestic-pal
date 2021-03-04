import 'package:flutter/material.dart';

class HomeCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        elevation: 0.0,
        title: Text('Customer Screen'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Text('hello team'),
      ),
    );  
  }
}