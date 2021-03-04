import 'package:domestic_pal/models/user.dart';
//import 'package:domestic_pal/screens/authenticate/signin_customer.dart';
import 'package:domestic_pal/screens/wrapper.dart';
import 'package:domestic_pal/services/auth_customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
