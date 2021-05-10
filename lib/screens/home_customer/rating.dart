import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RatingEmployee extends StatefulWidget {
  @override
  _RatingEmployeeState createState() => _RatingEmployeeState();
}

class _RatingEmployeeState extends State<RatingEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child:  RatingBar.builder(
    initialRating: 3,
    itemCount: 5,
    itemBuilder:  (context, index) {
       switch (index) {
          case 0:
             return Icon(
                Icons.sentiment_very_dissatisfied,
                color: Colors.red,
             );
          case 1:
             return Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.redAccent,
             );
          case 2:
             return Icon(
                Icons.sentiment_neutral,
                color: Colors.amber,
             );
          case 3:
             return Icon(
                Icons.sentiment_satisfied,
                color: Colors.lightGreen,
             );
          case 4:
              return Icon(
                Icons.sentiment_very_satisfied,
                color: Colors.green,
              );
       }
    },
    onRatingUpdate: (rating) {
      print(rating);
    },

      ),
    ));

  }
}
