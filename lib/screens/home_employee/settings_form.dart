import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:domestic_pal/shared/emploading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domestic_pal/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();
  String _currentname;
  String _currentPhone;
  String _currentLocation;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<EmployeeUserData>(
        stream: DatabaseEmployeeService(uid: user.uid).empDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            EmployeeUserData userData = snapshot.data;
            return Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Text('Update your Settings'),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecorationEmp,
                    initialValue: userData.name,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a name' : null,
                    onChanged: (value) => setState(() => _currentname = value),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecorationEmp,
                    //initialValue: userData.phoneNo,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a Phone Number' : null,
                    onChanged: (value) => setState(() => _currentPhone = value),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecorationEmp,
                    initialValue: userData.location,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a location' : null,
                    onChanged: (value) =>
                        setState(() => _currentLocation = value),
                  )
                ],
              ),
            );
          } else {
            return emploading();
          }
        });
  }
}
/*
import 'package:domestic_pal/screens/home_employee/update.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  @override
  Widget build(BuildContext context) {
    return UpdateDetails();
  }
}
*/
