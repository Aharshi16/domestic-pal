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

  int value;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return  StreamBuilder<EmployeeUserData>(
        stream: DatabaseEmployeeService(uid: user.uid).empDetails,
        builder: (context, snapshot) {
          EmployeeUserData userData = snapshot.data;
          if(userData.gender =='Female'){
            return Scaffold(
              backgroundColor: Colors.grey[900],
              body: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(

                        backgroundImage: AssetImage('assets/Icon.jpg'),
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
                        //fontSize: 16,
                        //fontWeight: FontWeight.w600,
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

                    SizedBox(
                      height: 30,
                    ),

                    Text(
                      'Phone Number',
                      style: TextStyle(
                        //fontSize: 16,
                        //fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 10.0),

                    Text(
                      '${userData.phoneNo}',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.amberAccent[200],
                      ),
                    ),


                    SizedBox(
                      height: 30,
                    ),

                    Text(
                      'Location',
                      style: TextStyle(
                        //fontSize: 16,
                        //fontWeight: FontWeight.w600,
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
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.amberAccent[200],
                      ),
                    ),



                  ],
                ),
              ),
            );
          }
          else
            {
              return Scaffold(
                backgroundColor: Colors.grey[900],
                body: Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                           backgroundImage: AssetImage('assets/Final_male.jpeg'),
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
                          //fontSize: 16,
                          //fontWeight: FontWeight.w600,
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

                      SizedBox(
                        height: 30,
                      ),

                      Text(
                        'Phone Number',
                        style: TextStyle(
                          //fontSize: 16,
                          //fontWeight: FontWeight.w600,
                          letterSpacing: 2.0,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 10.0),

                      Text(
                        '${userData.phoneNo}',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.amberAccent[200],
                        ),
                      ),


                      SizedBox(
                        height: 30,
                      ),

                      Text(
                        'Location',
                        style: TextStyle(
                          //fontSize: 16,
                          //fontWeight: FontWeight.w600,
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
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.amberAccent[200],
                        ),
                      ),



                    ],
                  ),
                ),
              );
            }

        });
  }
}
