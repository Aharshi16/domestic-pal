import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/services/database_customer.dart';
import 'package:flutter/material.dart';
import 'package:domestic_pal/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentPhone;
  String _currentCity;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<CustomerUserData>(
        stream: DatabaseCustomerService(uid: user.uid).customerUserData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CustomerUserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text('Update your settings'),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration,
                    initialValue: userData.name,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a name' : null,
                    onChanged: (value) => setState(() => _currentName = value),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.phone,
                    decoration: textInputDecoration,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter phone number' : null,
                    onChanged: (value) => setState(() => _currentPhone = value),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.city,
                    decoration: textInputDecoration,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a city' : null,
                    onChanged: (value) => setState(() => _currentCity = value),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseCustomerService(uid: user.uid)
                            .updateCustomerUserData(
                                'C',
                                _currentName ?? userData.name,
                                _currentPhone ?? userData.phone,
                                _currentCity ?? userData.city);
                      }
                      Navigator.pop(context);
                    },
                    color: Colors.amber,
                    child: Text(
                      'UPDATE',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            //return a loading a screen
          }
        });
  }
}
