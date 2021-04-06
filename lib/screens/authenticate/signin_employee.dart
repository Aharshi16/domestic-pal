import 'package:domestic_pal/screens/home_employee/home_employee.dart';
import 'package:domestic_pal/services/auth_employee.dart';
import 'package:domestic_pal/shared/emploading.dart';
import 'package:flutter/material.dart';
import 'package:domestic_pal/shared/constants.dart';

class SignInEmployee extends StatefulWidget {
  final Function toggleView;
  SignInEmployee({this.toggleView});

  @override
  _SignInEmployeeState createState() => _SignInEmployeeState();
}

class _SignInEmployeeState extends State<SignInEmployee> {
  final AuthService _authEmployee = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? emploading()
        : Scaffold(
            backgroundColor: Colors.cyan[50],
            appBar: AppBar(
              backgroundColor: Colors.cyan[800],
              elevation: 0.0,
              title: Text('domesticPal'),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      Text(
                        'Sign In as an Employee',
                        style:
                            TextStyle(color: Colors.cyan[800], fontSize: 20.0),
                      ),
                      SizedBox(height: 40.0),
                      TextFormField(
                        decoration:
                            textInputDecorationEmp.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        decoration: textInputDecorationEmp.copyWith(
                            hintText: 'Password'),
                        validator: (val) =>
                            val.length < 6 ? 'Enter a password' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 40.0),
                      RaisedButton(
                          color: Colors.cyan[800],
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _authEmployee
                                  .signInWithEmailAndPasswordEmployee(
                                      email, password);
                              /*dynamic result = await _authEmployee
                            .signInWithEmailAndPasswordEmployee(email, password);*/
                              if (result == null) {
                                setState(() => error =
                                    'could not sign in with those credentials');
                                loading = false;
                              } else {
                                setState(
                                    () => error = 'logged in successfully');
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomeEmployee()),
                                    (Route<dynamic> route) => false);
                              }
                            }
                          }),
                      SizedBox(height: 15.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New user?',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          FlatButton(
                            child: Text('Register',
                                style: TextStyle(color: Colors.cyan)),
                            onPressed: () {
                              widget.toggleView();
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
