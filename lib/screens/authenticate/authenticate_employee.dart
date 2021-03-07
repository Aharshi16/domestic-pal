import 'package:domestic_pal/screens/authenticate/register_employee.dart';
import 'package:domestic_pal/screens/authenticate/signin_employee.dart';
import 'package:flutter/material.dart';

class AuthenticateEmployee extends StatefulWidget {
  @override
  _AuthenticateEmployeeState createState() => _AuthenticateEmployeeState();
}

class _AuthenticateEmployeeState extends State<AuthenticateEmployee> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    //return SignInEmployee();
    //return RegisterEmployee();
    if(showSignIn == true){
      return SignInEmployee(toggleView: toggleView);
    }else{
      return RegisterEmployee(toggleView: toggleView);
    }
  }
}
