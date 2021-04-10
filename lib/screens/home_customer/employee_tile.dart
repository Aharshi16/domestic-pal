import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeeTile extends StatelessWidget {
  final DocumentSnapshot employee;
  EmployeeTile({this.employee});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.0,
      ),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown,
            backgroundImage: AssetImage('assets/Icon.jpg'),
          ),
          title: Text(employee['name']),
          subtitle: Text(employee['location']),
        ),
      ),
    );
  }
}
