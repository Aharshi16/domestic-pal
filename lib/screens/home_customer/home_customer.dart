import 'package:domestic_pal/screens/hire/hire.dart';
import 'package:domestic_pal/screens/home_customer/settings_form.dart';
import 'package:domestic_pal/services/auth_customer.dart';
import 'package:flutter/material.dart';

class HomeCustomer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[200],
        elevation: 0.0,
        title: Text('Customer Home Screen'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Hire()),
                  (Route<dynamic> route) => false);
            },
            icon: Icon(
              Icons.person,
            ),
            label: Text(
              'logout',
            ),
          ),
          FlatButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('Settings'))
        ],
      ),
      body: Padding(
        //padding: const EdgeInsets.fromLTRB(50.0, 10.0, 20.0, 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80.0),
            Text(
              'What are you looking for?',
              style: TextStyle(
                fontSize: 25.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 80.0),
            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              width: 250.0,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    blurRadius: 1,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: RaisedButton(
                elevation: 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                //color: Color.fromRGBO(0, 160, 227, 1),
                color: Colors.pink[200],
                textColor: Colors.white,
                child: Text('MAID', style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              width: 250.0,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    blurRadius: 1,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: RaisedButton(
                elevation: 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                //color: Color.fromRGBO(0, 160, 227, 1),
                color: Colors.orange[200],
                textColor: Colors.white,
                child: Text('COOK', style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              width: 250.0,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    blurRadius: 1,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: RaisedButton(
                elevation: 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                //color: Color.fromRGBO(0, 160, 227, 1),
                color: Colors.blue[200],
                textColor: Colors.white,
                child: Text('BABY SITTER', style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(height: 80.0)
          ],
        ),
      ),
    );
  }
}
