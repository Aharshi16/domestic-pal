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

/*class _ViewDetailsState extends State<ViewDetails> {

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
              backgroundColor: Colors.white,
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
}*/


class _ViewDetailsState extends State<ViewDetails> {

  String image;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return  StreamBuilder<EmployeeUserData>(
        stream: DatabaseEmployeeService(uid: user.uid).empDetails,
        builder: (context, snapshot) {
          EmployeeUserData userData = snapshot.data;
          if(userData.gender=='Female' && userData.jobProfile=='Cook')
            image='assets/female_cook';
          else if(userData.gender=='Female' && userData.jobProfile=='Maid')
            image='assets/Female_maid.png';
          else if(userData.gender=='Female' && userData.jobProfile=='Baby Sitter')
            image='assets/Female_babysitter';
          else if(userData.gender=='Male' && userData.jobProfile=='Cook')
            image='assets/Male_cook.jpg';
          else if(userData.gender=='Male' && userData.jobProfile=='Maid')
            image='assets/male_maid.png';
          else if(userData.gender=='Male' && userData.jobProfile=='Baby Sitter')
            image='assets/male_babysitter.png';
          return Scaffold(
            backgroundColor: Colors.white60,
            body: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 40.0, 30.0, 0.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
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
                  Container(
                    margin:EdgeInsets.zero,
                    height: 80.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black12,
                      width: 5),
                      color: Colors.black12,
                      gradient: new LinearGradient(
                        colors: [Colors.red, Colors.cyan],
                        begin: Alignment.centerRight,
                        end: new Alignment(-1.0, -1.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          blurRadius: 1,
                          offset: Offset(5, 5),
                        ),
                      ],
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(width: 300.0),
                        Text(
                          'Name:',
                          style: TextStyle(
                            fontSize: 20.0,
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
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 50.0,
                    color: Colors.white,
                  ),
                  Container(
                    margin:EdgeInsets.zero,
                    height: 80.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(
                          color: Colors.black12,
                          width: 5),
                      gradient: new LinearGradient(
                          colors: [Colors.red, Colors.cyan],
                          begin: Alignment.centerRight,
                          end: new Alignment(-1.0, -1.0),
                      ),

                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          blurRadius: 1,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        //SizedBox(width: 300.0),
                        Text(
                          'Phone No:',
                          style: TextStyle(
                            letterSpacing: 2.0,
                            color: Colors.grey,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${userData.phoneNo}',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 50.0,
                    color: Colors.white,
                  ),
                  Container(
                    margin:EdgeInsets.zero,
                    height: 80.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(
                          color: Colors.black12,
                          width: 5),
                      gradient: new LinearGradient(
                          colors: [Colors.red, Colors.cyan],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          blurRadius: 1,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        //SizedBox(width: 300.0),
                        Text(
                          'Location:',
                          style: TextStyle(
                            letterSpacing: 2.0,
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${userData.location}',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 50.0,
                    color: Colors.white,
                  ),
                  Container(
                    margin:EdgeInsets.zero,
                    height: 80.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(
                          color: Colors.black12,
                          width: 5),
                      gradient: new LinearGradient(
                        colors: [Colors.red, Colors.cyan],
                        begin: Alignment.centerRight,
                        end: new Alignment(-1.0, -1.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          blurRadius: 1,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        //SizedBox(width: 300.0),
                        Text(
                          'Aadhar No:',
                          style: TextStyle(
                            letterSpacing: 2.0,
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${userData.aadharNo}',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );

        });
  }
}