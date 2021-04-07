import 'package:flutter/material.dart';
import 'package:domestic_pal/shared/constants.dart';

class SettingsForm2 extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm2> {

  final _formkey = GlobalKey<FormState>();

  String name;
  String phoneNo;
  String gender;
  String aadharNo;
  String location;
  int workExperience;

  List jobProfile = [false, false, false];
  int currentValue = 0;
  int _groupValue = -1;

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

  Widget _buildname() {
    return TextFormField(
      decoration: _inputDecoration('Name'),
      style: _textStyle(),
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
  Widget _buildaadharNo() {
    return TextFormField(
      //initialValue: userData.aadharNo,
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

  Widget _buildlocation() {
    return TextFormField(
      //initialValue: userData.location,
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

  void _handleRadioValueChanged(int value) {
    setState(() {
      this._groupValue = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Text(
              'Update your Details',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            /*TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty ? 'Please enter a name' : null,
              onChanged: (val) => setState(() => _currentname = val),
            )*/
            _buildname(),
            SizedBox(height: 8.0),
            _buildphoneNumber(),
            SizedBox(height: 8.0),
            _buildaadharNo(),
            SizedBox(height: 8.0),
            _buildgender(_groupValue, _handleRadioValueChanged),
            SizedBox(height: 8.0),
            _buildlocation(),
            SizedBox(height: 8.0),
          ],
        ),
      );
  }
}



/*Widget _buildphoneNumber() {
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
      onSaved: (String value) {
        phoneNo = value;
      },
    );
  }

  //addressField
  Widget _buildaddress() {
    return TextFormField(
      decoration: _inputDecoration('Address'),
      style: _textStyle(),
      validator: (String value) {
        if(value.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      onSaved: (String value) {
        address = value;
      },
    );
  }

  //gender radioButton
  Widget _buildgender(int groupValue, handleRadioValueChanged) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        'Gender',
        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      Row(
        children: <Widget>[
          Radio(value: 0, groupValue: groupValue, onChanged: handleRadioValueChanged),
          Text(
            "Male",
            style: new TextStyle(
                fontSize: 14.0
            ),
          ),
          Radio(value: 1, groupValue: groupValue, onChanged: handleRadioValueChanged),
          Text(
            "Female",
            style: new TextStyle(
              fontSize: 14.0,
            ),
          ),
          Radio(value: 2, groupValue: groupValue, onChanged: handleRadioValueChanged),
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

  Widget _buildlocality() {
    return TextFormField(
      decoration: _inputDecoration('Location'),
      style: _textStyle(),
      validator: (String value) {
        if(value.isEmpty) {
          return 'Locality is Required';
        }
        return null;
      },
      onSaved: (String value) {
        locality = value;
      },
    );
  }
  /*Widget _buildworkExperience(){
    return TextFormField(
      decoration: _inputDecoration('Work Experience'),
      style: _textStyle(),


    );
  }
*/
  _checkbox(title,int index, bool boolValue, handleCheckBox) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: boolValue,
          onChanged: (bool value){
            boolValue=value;
            handleCheckBox(index, boolValue);
          },
        ),
        Text(title),
      ],
    );
  }


  void _handleCheckBox (int index, bool isActive) {
    setState(() {
      this.jobProfile[index] = isActive;
    });
  }

  void _changedDropDownItem(value){
    setState(() {
      this.currentValue = value;
    });
  }

  void _handleRadioValueChanged(int value){
    setState(() {
      this._groupValue = value;
    });
  }*/