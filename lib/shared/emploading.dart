import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class emploading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[100],
      child: Center(
        child: SpinKitCubeGrid(
          color: Colors.cyan[800],
          size: 50.0,
        ),
      ),
    );
  }
}
