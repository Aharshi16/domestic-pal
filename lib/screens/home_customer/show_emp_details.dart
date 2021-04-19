import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final DocumentSnapshot employee;
  DetailScreen({this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee['name']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(employee['gender']),
      ),
    );
  }
}
