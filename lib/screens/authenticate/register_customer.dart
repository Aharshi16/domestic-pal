import 'package:flutter/material.dart';
import 'package:domestic_pal/services/auth_customer.dart';
import 'package:domestic_pal/shared/constants.dart';

class RegisterCustomer extends StatefulWidget {
  @override
  final Function toggleView;
  RegisterCustomer({this.toggleView});
  _RegisterCustomerState createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  final AuthService _authCustomer = AuthService();
  final _formKey = GlobalKey<FormState>();
  @override
  String email = '';
  String password = '';
  String error = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        elevation: 0.0,
        title: Text('REGISTER SCREEN'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Log In'),
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
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.blueGrey[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _authCustomer
                          .registerWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => error =
                            'could not register with those credentials');
                      }
                    }
                  }),
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
