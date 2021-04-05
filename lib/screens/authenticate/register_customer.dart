import 'package:domestic_pal/screens/home_customer/update_details.dart';
import 'package:flutter/material.dart';
import 'package:domestic_pal/services/auth_customer.dart';
import 'package:domestic_pal/shared/constants.dart';
import 'package:domestic_pal/shared/cusloading.dart';
//import 'package:domestic_pal/screens/home_employe';
//import 'package:domestic_pal/screens/home_employee/home_employee.dart';
//import 'package:domestic_pal/screens/home_customer/home_customer.dart';

class RegisterCustomer extends StatefulWidget {
  final Function toggleView;
  @override
  RegisterCustomer({this.toggleView});
  _RegisterCustomerState createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  final AuthService _authCustomer = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
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
                SizedBox(height: 20.0),
                Text(
                  'Register as a Customer',
                  style: TextStyle(color: Colors.grey, fontSize: 20.0),
                ),
                SizedBox(height: 40.0),
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
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
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
                        setState(() => loading = true);
                        dynamic result = await _authCustomer
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error =
                              'could not register with those credentials');
                               loading = false;
                        } else {
                          setState(() => error = 'registered successfully');
                          //Navigator.pop(context);

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateCustomerDetails()),
                              (Route<dynamic> route) => false);
                        }
                      }
                    }),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    FlatButton(
                      child: Text('Sign In',
                          style: TextStyle(color: Colors.orange)),
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
