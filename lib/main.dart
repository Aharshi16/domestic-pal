import 'package:domestic_pal/screens/hire/hire.dart';
//import 'package:brew_crew/services/auth.dart';
import 'package:domestic_pal/screens/wrapper.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:brew_crew/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}
