import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:domestic_pal/services/auth_employee.dart';
//import 'package:domestic_pal/services/database_employee.dart';
import 'package:provider/provider.dart';
//import 'package:domestic_pal/models/user.dart';

class ViewDetails extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {

  String image;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return  StreamBuilder<EmployeeUserData>(
        stream: DatabaseEmployeeService(uid: user.uid).empDetails,
        builder: (context, snapshot) {
          EmployeeUserData userData = snapshot.data;
          if(userData.gender=='Female')
            image='assets/Icon.jpg';
          else
            image='assets/Final_male.jpeg';
            return Scaffold(
              backgroundColor: Colors.grey[900],
              body: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(image),
                        radius: 40.0,
                      ),
                    ),
                    Divider(
                      height: 90.0,
                      color: Colors.grey[800],
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 10.0),

                    Text(
                      '${userData.name}',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.amberAccent[200],
                      ),
                    ),

                    //SizedBox(height: 30),
                    Divider(
                      height: 50.0,
                      color: Colors.grey[800],
                    ),

                    Text(
                      'Phone Number',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 10.0),

                    Text(
                      '${userData.phoneNo}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.amberAccent[200],
                      ),
                    ),


                    //SizedBox(height: 30),
                    Divider(
                      height: 50.0,
                      color: Colors.grey[800],
                    ),

                    Text(
                      'Location',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${userData.location}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.amberAccent[200],
                      ),
                    ),
                    Divider(
                      height: 50.0,
                      color: Colors.grey[800],
                    ),
                    Text(
                      'Aadhar Number',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${userData.aadharNo}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.amberAccent[200],
                      ),
                    ),



                  ],
                ),
              ),
            );

        });
  }
}