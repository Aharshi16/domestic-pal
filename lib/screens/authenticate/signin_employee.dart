import 'package:domestic_pal/services/auth_employee.dart';
import 'package:flutter/material.dart';

class SignInEmployee extends StatefulWidget {

  final Function toggleView;
  SignInEmployee({this.toggleView});

  @override
  _SignInEmployeeState createState() => _SignInEmployeeState();
}

class _SignInEmployeeState extends State<SignInEmployee> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        elevation: 0.0,
        title: Text('Sign in as employee'),
        actions: <Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label:Text('Register'),
            onPressed: (){
              widget.toggleView();
            },
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
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.cyan[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailAndPasswordEmployee(email, password);
                    if (result == null) {
                      setState(() =>
                          error = 'could not sign in with those credentials');
                    }else {
                      setState(() => error = 'logged in successfully');
                      Navigator.pop(context);
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
