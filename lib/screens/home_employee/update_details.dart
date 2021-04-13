import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/screens/home_employee/home_employee.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:domestic_pal/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UpdateEmployeeDetails extends StatefulWidget {
  @override
  _UpdateEmployeeDetailsState createState() => _UpdateEmployeeDetailsState();
}

class _UpdateEmployeeDetailsState extends State<UpdateEmployeeDetails> {
  final _formKey = GlobalKey<FormState>();
  final List<String> genders = ['Female', 'Male', 'Others'];
  final List<String> jobs = ['Maid', 'Cook', 'Baby Sitter'];

  String _name;
  String _phone;
  String _aadhar;
  String _location;
  String _gender;
  String _workExperience;
  int _rating;
  String _jobProfile;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<EmployeeUserData>(
        stream: DatabaseEmployeeService(uid: user.uid).empDetails,
        builder: (context, snapshot) {
          EmployeeUserData userData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan[900],
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
                      SizedBox(height: 8.0),
                      /*Text(
                        'Register Details',
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                      ),*/
                      SizedBox(height: 8.0),
                      //name
                      TextFormField(
                        decoration:
                            textInputDecorationEmp.copyWith(hintText: 'Name'),
                        validator: (val) => val.isEmpty ? 'Enter a name' : null,
                        onChanged: (val) {
                          setState(() {
                            _name = val;
                          });
                        },
                      ),
                      SizedBox(height: 8.0),
                      //Phone no
                      TextFormField(
                        decoration: textInputDecorationEmp.copyWith(
                            hintText: 'Phone Number'),
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        validator: (val) => val.length < 10
                            ? 'Enter a valid Phone Number'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            _phone = val;
                          });
                        },
                      ),
                      SizedBox(height: 8.0),
                      //aadhar
                      TextFormField(
                        decoration:
                            textInputDecorationEmp.copyWith(hintText: 'aadhar'),
                        maxLength: 12,
                        validator: (val) =>
                            val.isEmpty ? 'Enter the aadhar no' : null,
                        onChanged: (val) {
                          setState(() {
                            _aadhar = val;
                          });
                        },
                      ),
                      SizedBox(height: 8.0),
                      //gender drop down
                      DropdownButtonFormField(
                        decoration: textInputDecorationEmp,
                        hint: Text('Gender'),
                        items: genders.map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text('$gender'),
                          );
                        }).toList(),
                        onChanged: (val) => setState(() => _gender = val),
                      ),
                      SizedBox(height: 10.0),
                      //Location
                      TextFormField(
                        decoration:
                            textInputDecorationEmp.copyWith(hintText: 'City'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter the city' : null,
                        onChanged: (val) {
                          setState(() {
                            _location = val;
                          });
                        },
                      ),
                      SizedBox(height: 10.0),
                      //job profile dropdown
                      DropdownButtonFormField(
                        decoration: textInputDecorationEmp,
                        hint: Text('Select Job Profile'),
                        items: jobs.map((job) {
                          return DropdownMenuItem(
                            value: job,
                            child: Text('$job'),
                          );
                        }).toList(),
                        onChanged: (val) => setState(() => _jobProfile = val),
                      ),
                      SizedBox(height: 8.0),
                      //WorkExperience
                      TextFormField(
                        decoration: textInputDecorationEmp.copyWith(
                            hintText: 'Work Experience'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter the Work Experience' : null,
                        onChanged: (val) {
                          setState(() {
                            _workExperience = val;
                          });
                        },
                      ),
                      /*Slider(
                        min: 100.0,
                        max: 700.0,
                        divisions: 6,
                        // onChanged: (val) => setState(() => _workExperience = val.round()),
                      ),*/
                      SizedBox(height: 20),
                      RaisedButton(
                        color: Colors.cyan[900],
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseEmployeeService(uid: user.uid)
                                .updateEmployeeUserData(
                              'E',
                              _name ?? userData.name,
                              _phone ?? userData.phoneNo,
                              _gender ?? userData.gender,
                              _aadhar ?? userData.aadharNo,
                              _location ?? userData.location,
                              _workExperience ?? userData.workExperience,
                              _rating ?? 0,
                              _jobProfile ?? userData.jobProfile,
                            );
                          }
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomeEmployee()),
                              (Route<dynamic> route) => false);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
