import 'package:domestic_pal/screens/home_employee/home_employee.dart';
import 'package:domestic_pal/services/auth_employee.dart';
import 'package:domestic_pal/shared/emploading.dart';
import 'package:flutter/material.dart';
import 'package:domestic_pal/shared/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';


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
  bool _showPassword = false;

  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? emploading()
        : Scaffold(
            backgroundColor: Colors.cyan[50],
            //backgroundColor: Colors.black,
            /*appBar: AppBar(
              backgroundColor: Colors.cyan[800],
              elevation: 0.0,
              title: Text('domesticPal'),
            ),*/
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //Positioned(top: 50, left: 0, child: _backButton()),
                      SizedBox(height: 40.0),
                      Text(
                        'Sign In as an Employee',
                        style:
                            TextStyle(color: Colors.cyan[800], fontSize: 20.0),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        margin:EdgeInsets.symmetric(vertical: 10),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Email ID',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration:
                              InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true
                              ),
                              validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                          ],
                        )

                      ),
                      SizedBox(height: 20.0),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                  //labelText: 'Password',
                                  //hintText: 'Enter your password',
                                fillColor: Color(0xfff3f3f4),
                                filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _showPassword
                                          ? Icons.visibility_sharp
                                          : Icons.visibility_off_sharp,
                                      color: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                  )),
                              obscureText: !_showPassword,
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              }),
                        ]

                      ),
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
                                _showToast('You have logged in successfully');
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
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
  }
}


