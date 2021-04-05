import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/screens/home_employee/home_employee.dart';
import 'package:domestic_pal/screens/home_employee/view.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateDetails extends StatefulWidget {
  @override
  _UpdateDetailsState createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  List jobProfile = [false, false, false];
  int currentValue = 0;
  int _groupValue = -1;
  /*bool _show = true;
  bool _accept = true;*/

  String userCategory;
  String name;
  String phoneNo;
  String gender;
  String aadharNo;
  String location;
  int workExperience;
  int rating;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //color Converter
  _hexToColor(String code) =>
      Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

//InputDecoration
  _inputDecoration(label) => InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(18.0),
          borderSide: new BorderSide()));

//TextStyle
  _textStyle() => TextStyle(color: _hexToColor("#F2A03D"), fontSize: 14.0);

  Widget _buildname(EmployeeUserData userData) {
    return TextFormField(
      initialValue: userData.name,
      decoration: _inputDecoration('Name'),
      style: _textStyle(),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onChanged: (value) => setState(() => name = value),
      onSaved: (String value) {
        name = value;
      },
    );
  }

  //phoneNumber Field
  Widget _buildphoneNumber(EmployeeUserData userData) {
    return TextFormField(
      decoration: _inputDecoration('Phone Number'),
      keyboardType: TextInputType.phone,
      maxLength: 10,
      style: _textStyle(),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number is Required';
        }
        return null;

      },
      onChanged: (value) => setState(() => phoneNo = value),
      onSaved: (String value) {
        phoneNo = value;
      },
    );
  }

  //aadharNo Field
  Widget _buildaadharNo(EmployeeUserData userData) {
    return TextFormField(
      initialValue: userData.aadharNo,
      decoration: _inputDecoration('AadharNo'),
      style: _textStyle(),
      maxLength: 12,
      validator: (String value) {
        if (value.isEmpty) {
          return 'AadharNo is required';
        }
          return null;

      },
      onChanged: (value) => setState(() => name = value),
      onSaved: (String value) {
        aadharNo = value;
      },
    );
  }

  //gender radioButton
  Widget _buildgender(int groupValue, handleRadioValueChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Gender',
          style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Row(
          children: <Widget>[
            Radio(
                value: 0,
                groupValue: groupValue,
                onChanged: handleRadioValueChanged),
            Text(
              "Male",
              style: new TextStyle(fontSize: 14.0),
            ),
            Radio(
                value: 1,
                groupValue: groupValue,
                onChanged: handleRadioValueChanged),
            Text(
              "Female",
              style: new TextStyle(
                fontSize: 14.0,
              ),
            ),
            Radio(
                value: 2,
                groupValue: groupValue,
                onChanged: handleRadioValueChanged),
            Text(
              "Others",
              style: new TextStyle(
                fontSize: 14.0,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildlocation(EmployeeUserData userData) {
    return TextFormField(
      initialValue: userData.location,
      decoration: _inputDecoration('Location'),
      style: _textStyle(),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Locality is Required';
        }
          return null;
      },
      onSaved: (String value) {
        location = value;
      },
      onChanged: (value) => setState(() => name = value),
    );
  }

  _checkbox(title, int index, bool boolValue, handleCheckBox) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            boolValue = value;
            handleCheckBox(index, boolValue);
          },
        ),
        Text(title),
      ],
    );
  }

  void _handleCheckBox(int index, bool isActive) {
    setState(() {
      this.jobProfile[index] = isActive;
    });
  }

  /*void _changedDropDownItem(value) {
    setState(() {
      this.currentValue = value;
    });
  }*/

  void _handleRadioValueChanged(int value) {
    setState(() {
      this._groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: StreamBuilder<EmployeeUserData>(
            stream: DatabaseService(uid: user.uid).empDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                EmployeeUserData userData = snapshot.data;

                return ListView(
                  children: <Widget>[
                    _buildname(userData),
                    SizedBox(
                      height: 8.0,
                    ),
                    _buildphoneNumber(userData),
                    SizedBox(
                      height: 8.0,
                    ),
                    _buildaadharNo(userData),
                    SizedBox(
                      height: 8.0,
                    ),
                    _buildgender(_groupValue, _handleRadioValueChanged),
                    SizedBox(
                      height: 8.0,
                    ),
                    _buildlocation(userData),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Job Profile",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    _checkbox("Maid", 0, jobProfile[0], _handleCheckBox),
                    _checkbox("Cook", 1, jobProfile[1], _handleCheckBox),
                    _checkbox("Babysitter", 2, jobProfile[2], _handleCheckBox),
                    SizedBox(
                      height: 8.0,
                    ),Text('Work Experience',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      value: (workExperience ?? 0).toDouble(),
                      activeColor: Colors.brown[workExperience ?? 0],
                      inactiveColor: Colors.brown[workExperience ?? 0],
                      min: 0.0,
                      max: 10.0,
                      divisions: 10,
                      onChanged: (val) => setState(() => workExperience = val.round()),
                    ),
                    SizedBox(height: 8.0,),
                    RaisedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              'E',
                              name ?? userData.name,
                              phoneNo ?? userData.phoneNo,
                              gender ?? userData.gender,
                              aadharNo ?? userData.aadharNo,
                              location ?? userData.location,
                              workExperience ?? userData.workExperience,
                              rating ?? '0',
                              jobProfile ?? userData.jobProfile);
                        }
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => HomeEmployee()),
                            (Route<dynamic> route) => false);
                        _formKey.currentState.save();

                        /*print(name);
                        print(phoneNo);
                        print(gender);
                        print(location);
                        print(workExperience);*/

                        //Send to API
                      },
                    )
                  ],
                );
              }
            }),
      ),
    );
  }
}
