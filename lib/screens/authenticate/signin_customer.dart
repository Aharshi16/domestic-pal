import 'package:domestic_pal/services/auth_customer.dart';
import 'package:flutter/material.dart';
import 'package:domestic_pal/shared/constants.dart';

class SignInCustomer extends StatefulWidget {
  final Function toggleView;
  SignInCustomer({this.toggleView});
  @override
  _SignInCustomerState createState() => _SignInCustomerState();
}

class _SignInCustomerState extends State<SignInCustomer> {
  final AuthService _authCustomer = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        elevation: 0.0,
        title: Text('LOGIN SCREEN'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: ()  {
              },
              icon: Icon(Icons.person),
              label: Text('Register'),
            )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
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
                  if(_formKey.currentState.validate()){
                     dynamic result = await _authCustomer.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() => error = 'could not sign in with those credentials');
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
