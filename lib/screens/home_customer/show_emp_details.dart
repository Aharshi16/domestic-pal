import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:domestic_pal/services/database_employee.dart';
import 'package:flutter/material.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailScreen extends StatefulWidget {
  final DocumentSnapshot employee;
  DetailScreen({this.employee});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //static const double docRating = 3.0;
  String _rate, avgrating;

  _callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}

  @override
  Widget build(BuildContext context) {
    String image;
    if (widget.employee['gender'] == 'Female') {
      image = 'assets/Icon.jpg';
    } else {
      image = 'assets/Final_male.jpeg';
    }
    Color color;

    double docRating = double.parse(widget.employee['rating']);
    double currentRating = 0;

    //if(employee['jobProfile'])
    switch (widget.employee['jobProfile']) {
      case 'Maid':
        color = Colors.pink[300];
        break;
      case 'Cook':
        color = Colors.orange[300];
        break;
      case 'Baby Sitter':
        color = Colors.blue[300];
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Employee Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 40.0,
            ),
            Divider(
              height: 30.0,
              color: Colors.grey[800],
            ),
            //SizedBox(height: 20),
            Text(
              widget.employee['name'],
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //SizedBox(width: 10.0),
                Icon(
                  Icons.location_on_outlined,
                  size: 40.0,
                  color: Colors.red[400],
                ),
                Text(
                  widget.employee['location'],
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Icon(
                  Icons.person_outline,
                  size: 40.0,
                  color: Colors.blue[400],
                ),
                SizedBox(width: 4.0),
                Text(
                  widget.employee['gender'],
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Rate your experience!', style: TextStyle(fontSize: 25.0)),
            // RatingBar(),
            SmoothStarRating(
              size: 40,
              color: color,
              rating: currentRating,
              onRated: (double value) async {
                if (docRating == 0.0) {
                  avgrating = value.toString();
                } else {
                  double avg = (docRating + value) / 2;
                  avgrating = avg.toString();
                }

                currentRating = value;
                await DatabaseEmployeeService(uid: widget.employee.documentID)
                    .updateEmployeeUserData(
                  'E',
                  widget.employee['name'],
                  widget.employee['phoneNo'],
                  widget.employee['gender'],
                  widget.employee['aadharNo'],
                  widget.employee['location'],
                  widget.employee['workExperience'],
                  avgrating,
                  widget.employee['jobProfile'],
                );
                print(_rate);
              },
              borderColor: color,
              allowHalfRating: false,
            ),
            SizedBox(
              height: 100.0,
            ),
            Center(
              child: Text('Average rating: $docRating',
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
            ),
            SizedBox(
              height: 100.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.phone_rounded,
                  size: 50.0,
                  color: Colors.green[400],
                ),
                ElevatedButton(
  child: Text("Call"),
  onPressed: () {
    _callNumber(widget.employee['phoneNo'].text);
  },
),
                Text(
                  'Contact Me',
                  style: TextStyle(fontSize: 20.0),
                ),
                Icon(
                  Icons.message_rounded,
                  size: 50.0,
                  color: Colors.blue[400],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
