import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/screens/home_customer/home_customer.dart';
import 'package:domestic_pal/services/database_customer.dart';
import 'package:flutter/material.dart';
import 'package:domestic_pal/shared/constants.dart';
import 'package:provider/provider.dart';

class UpdateCustomerDetails extends StatefulWidget {
  @override
  _UpdateCustomerDetailsState createState() => _UpdateCustomerDetailsState();
}

class _UpdateCustomerDetailsState extends State<UpdateCustomerDetails> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _phonenumber;
  String _city;
  //String error = '';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<CustomerUserData>(
        stream: DatabaseCustomerService(uid: user.uid).customerUserData,
        builder: (context, snapshot) {
          CustomerUserData userData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber[500],
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
                      SizedBox(height: 20.0),
                      Text(
                        'Register Details',
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                      ),
                      SizedBox(height: 40.0),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'name'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() => _name = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'phone number'),
                          validator: (val) => val.length < 10
                              ? 'Enter a phone number 10 chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => _phonenumber = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'city'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a city' : null,
                          onChanged: (val) {
                            setState(() => _city = val);
                          }),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: Colors.blueGrey[400],
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await DatabaseCustomerService(uid: user.uid)
                                  .updateCustomerUserData(
                                      'C',
                                      _name ?? userData.name,
                                      _phonenumber ?? userData.phone,
                                      _city ?? userData.city);
                            }
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomeCustomer()),
                                (Route<dynamic> route) => false);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}