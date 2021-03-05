import 'package:domestic_pal/services/auth_customer.dart';
import 'package:flutter/material.dart';

class HomeCustomer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        elevation: 0.0,
        title: Text('Customer Home Screen'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout')
            )
        ],
        
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Text('What are you looking for?'),
      ),
    );
  }
}
