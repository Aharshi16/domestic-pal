import 'package:flutter/material.dart';
import 'package:domestic_pal/shared/constants.dart';

class UpdateCustomerDetails extends StatefulWidget {
  @override
  _UpdateCustomerDetailsState createState() => _UpdateCustomerDetailsState();
}

class _UpdateCustomerDetailsState extends State<UpdateCustomerDetails> {
  @override

  final _formKey = GlobalKey<FormState>();

  String name = '';
  String phonenumber = '';
  String city = '';
  //String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        elevation: 0.0,
        title: Text('domesticPal'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
               Text(
                'Update Details',
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'name'),
                  validator: (val) => val.isEmpty ? 'Enter a name' : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'phone number'),
                  obscureText: true,
                  validator: (val) =>
                      val.length < 10 ? 'Enter a phone number 10 chars long' : null,
                  onChanged: (val) {
                    setState(() => phonenumber = val);
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'city'),
                  validator: (val) => val.isEmpty ? 'Enter a city' : null,
                  onChanged: (val) {
                    setState(() => city = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.blueGrey[400],
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print(name);
                    print(phonenumber);
                    print(city);
                  }
                  ),
              /*SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
               SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New user?',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  FlatButton(
                    child:
                        Text('Register', style: TextStyle(color: Colors.orange)),
                    onPressed: () {
                      widget.toggleView();
                    },
                  )
                ],
              )*/
            ],
          ),
        ),
      ),
    );
  }
}