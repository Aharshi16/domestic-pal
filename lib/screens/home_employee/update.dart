import 'package:flutter/material.dart';
//import 'package:domestic_pal/services/auth_employee.dart';
//import 'package:domestic_pal/services/database_employee.dart';
//import 'package:provider/provider.dart';

class UpdateDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<UpdateDetails> {
  String name;
  String gender;
  String location;
  String workExperience;
  String phoneNo;
  String jobProfile;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildname() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget _buildphoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone Number'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number is Required';
        }

        /*if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }*/

        return null;
      },
      onSaved: (String value) {
        phoneNo = value;
      },
    );
  }

  Widget _buildgender() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Gender'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Gender is Required';
        }

        return null;
      },
      onSaved: (String value) {
        gender = value;
      },
    );
  }

  Widget _buillocation() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Location'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Location is Required';
        }

        return null;
      },
      onSaved: (String value) {
        location = value;
      },
    );
  }

  Widget _buildworkExperience() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Work Experience'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Work Experience is Required';
        }

        return null;
      },
      onSaved: (String value) {
        workExperience = value;
      },
    );
  }

  Widget _buildjobProfile() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Job Profile'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Ratings must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        jobProfile = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(6.0),
                  color: Colors.cyan[100],
                  child: Text(
                    'Update Details',
                    style: TextStyle(color: Colors.cyan[900], fontSize: 25.0),
                  ),
                ),
                _buildname(),
                SizedBox(
                  height: 20.0,
                ),
                _buildphoneNumber(),
                SizedBox(
                  height: 20.0,
                ),
                _buildgender(),
                SizedBox(
                  height: 20.0,
                ),
                _buillocation(),
                SizedBox(
                  height: 20.0,
                ),
                _buildjobProfile(),
                SizedBox(
                  height: 20.0,
                ),
                _buildworkExperience(),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.1),
                        blurRadius: 1,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: RaisedButton(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.white)),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      _formKey.currentState.save();

                      print(name);
                      print(phoneNo);
                      print(gender);
                      print(location);
                      print(workExperience);
                      print(jobProfile);

                      //Send to API
                    },
                    padding: EdgeInsets.all(10.0),
                    //color: Color.fromRGBO(0, 160, 227, 1),
                    color: Colors.cyan[200],
                    textColor: Colors.white,
                    child: Text('SUBMIT', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
