import 'package:domestic_pal/models/user.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
//import 'package:domestic_pal/models/user.dart';

class EmployeeDetails extends StatefulWidget {
  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    final details = Provider.of<EmployeeUserData>(context);
    print(details.name);
    print(details.phoneNo);
    print(details.gender);
    print(details.location);
    print(details.jobProfile);
    print(details.workExperience);
    return Container();
  }
}
