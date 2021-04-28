import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domestic_pal/screens/home_customer/ratingbar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final DocumentSnapshot employee;
  DetailScreen({this.employee});

  @override
  Widget build(BuildContext context) {
    String image;
    if (employee['gender'] == 'Female') {
      image = 'assets/Icon.jpg';
    } else {
      image = 'assets/Final_male.jpeg';
    }
    Color color;
    //if(employee['jobProfile'])
    switch (employee['jobProfile']) {
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
              employee['name'],
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
                  employee['location'],
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
                  employee['gender'],
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Rate your experience!', style: TextStyle(fontSize: 25.0)),
            RatingBar(),
            SizedBox(
              height: 200.0,
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
