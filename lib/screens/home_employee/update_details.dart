import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/screens/home_employee/home_employee.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:domestic_pal/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateEmployeeDetails extends StatefulWidget {
  @override
  _UpdateEmployeeDetailsState createState() => _UpdateEmployeeDetailsState();
}

class _UpdateEmployeeDetailsState extends State<UpdateEmployeeDetails> {

  final _formKey = GlobalKey<FormState>();

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
        builder: (context,snapshot){
          EmployeeUserData userData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent[500],
              elevation: 0.0,
              title: Text('domesticPal'),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Text(
                        'Register Details',
                        style: TextStyle(color: Colors.grey,fontSize: 20.0),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: textInputDecorationEmp.copyWith(hintText: 'Name'),
                        validator: (val) => val.isEmpty ? 'Enter a name' : null,
                        onChanged: (val) {
                          setState(() {
                            _name=val;
                          });
                        },
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: textInputDecorationEmp.copyWith(hintText: 'Phone Number'),
                        validator: (val) => val.length < 10 ? 'Enter a valid Phone Number' : null,
                        onChanged: (val){
                          setState(() {
                            _phone = val;
                          });
                        },
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: textInputDecorationEmp.copyWith(hintText: 'Location'),
                        validator: (val) => val.isEmpty ? 'Enter the location' : null,
                        onChanged: (val) {
                          setState(() {
                            _location=val;
                          });
                        },
                      ),
                      SizedBox(height: 8.0),
                      RaisedButton(
                        color: Colors.blueGrey[400],
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseEmployeeService(uid: user.uid).updateEmployeeUserData(
                                'E',
                                _name ?? userData.name,
                                _phone ?? userData.phoneNo ,
                                _gender ?? userData.gender,
                                _aadhar ?? userData.aadharNo,
                                _location ?? userData.location,
                                _workExperience ?? userData.workExperience,
                                _rating ?? 0,
                                _jobProfile ?? userData.jobProfile,
                            );
                          }
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => HomeEmployee()),
                                  (Route<dynamic>route) => false);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
