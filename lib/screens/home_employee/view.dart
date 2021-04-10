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
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return  StreamBuilder<EmployeeUserData>(
        stream: DatabaseEmployeeService(uid: user.uid).empDetails,
        builder: (context, snapshot) {
          EmployeeUserData userData = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.grey[900],
            body: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/Icon.jpg'),
                    radius: 40.0,

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

                  /*Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(10),
                    color: Colors.cyan[600],
                    child: Text('Phone No: ${userData.phoneNo}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(10),
                    color: Colors.cyan[500],
                    child: Text('Gender: ${userData.gender}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(10),
                    color: Colors.cyan[400],
                    child: Text('Location: ${userData.location}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),
                  /*SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(10),
                    color: Colors.cyan[300],
                    child: Text('Rating ${userData.}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),*/
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(10),
                    color: Colors.cyan[200],
                    child: Text('Job Profile: ${userData.jobProfile}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(10),
                    color: Colors.cyan[100],
                    child: Text('Work Experience: ${userData.workExperience}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),*/
                ],
              ),
            ),
          );
        });
  }
}
