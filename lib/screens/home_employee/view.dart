import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:domestic_pal/services/auth_employee.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:provider/provider.dart';
import 'package:domestic_pal/models/user.dart';

class ViewDetails extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<EmployeeUserData>>.value(
      value: DatabaseService().empDetails,
      child: Scaffold(
        backgroundColor: Colors.cyan[50],
        /*appBar: AppBar(
          title: Text('View Details Page'),
        ),*/
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              color: Colors.cyan[700],
              child: Text(
                'Name:',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              color: Colors.cyan[600],
              child: Text('Phone No:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              color: Colors.cyan[500],
              child: Text('Gender:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              color: Colors.cyan[400],
              child: Text('Location:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            /*Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              color: Colors.cyan[300],
              child: Text('Date of Birth:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 12,
            ),*/
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              color: Colors.cyan[300],
              child: Text('Job Profile:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(10),
              color: Colors.cyan[200],
              child: Text('Work Experience:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
