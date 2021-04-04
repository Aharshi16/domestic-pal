import 'package:flutter/material.dart';

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
  String rating;

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
      keyboardType: TextInputType.phone,
      maxLength: 10,
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

  Widget _buildgender() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Gender'),
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

  Widget _buildrating() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ratings'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Ratings must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        rating = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildname(),
                _buildphoneNumber(),
                _buildgender(),
                _buillocation(),
                _buildrating(),
                _buildworkExperience(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                  

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
