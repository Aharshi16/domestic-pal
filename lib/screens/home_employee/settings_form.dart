/*import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:domestic_pal/shared/emploading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domestic_pal/screens/home_employee/update.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<EmployeeUserData>(
      stream: DatabaseEmployeeService(uid: user.uid).EmployeeUserData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return UpdateDetails();
        }
        else{
          return emploading();
        }

      }

    );

}
*/
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
