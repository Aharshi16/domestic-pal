//import 'package:domestic_pal/services/auth_customer.dart';
import 'package:domestic_pal/services/auth_employee.dart';
import 'package:flutter/material.dart';

class SignInEmployee extends StatefulWidget {
  @override
  _SignInEmployeeState createState() => _SignInEmployeeState();
}

class _SignInEmployeeState extends State<SignInEmployee> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        elevation: 0.0,
        title: Text('Sign in as employee'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign in anon'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null)
              print('Error signing in');
            else {
              print('Signed in');
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
