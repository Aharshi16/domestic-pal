import 'package:domestic_pal/services/auth_customer.dart';
import 'package:flutter/material.dart';

class SignInCustomer extends StatefulWidget {
  @override
  _SignInCustomerState createState() => _SignInCustomerState();
}

class _SignInCustomerState extends State<SignInCustomer> {
  final AuthService _authCustomer = AuthService();
  //text field state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        elevation: 0.0,
        title: Text('LOGIN SCREEN'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blueGrey[400],
                child: Text(
                  'Sign In',
                  style: TextStyle(color:Colors.white),
                ),
                onPressed: () async {
                  print(email);
                  print(password);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
