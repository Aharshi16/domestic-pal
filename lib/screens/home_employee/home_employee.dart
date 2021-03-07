import 'package:domestic_pal/screens/hire/hire.dart';
import 'package:domestic_pal/services/auth_employee.dart';
import 'package:flutter/material.dart';

class HomeEmployee extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text('Employee home screen'),
        backgroundColor: Colors.cyan[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              print("logged out of employee");
              await _auth.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Hire()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
