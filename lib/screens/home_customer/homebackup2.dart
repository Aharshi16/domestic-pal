import 'package:domestic_pal/screens/hire/hire.dart';
import 'package:domestic_pal/screens/home_customer/settings_form.dart';
//import 'package:domestic_pal/screens/home_customer/view_list.dart';
import 'package:domestic_pal/screens/home_customer/maidlist.dart';
import 'package:domestic_pal/screens/home_customer/cooklist.dart';
import 'package:domestic_pal/screens/home_customer/babysitterlist.dart';
import 'package:domestic_pal/services/auth_customer.dart';
import 'package:domestic_pal/shared/bezierContainer.dart';
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

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      /* appBar: AppBar(
        //backgroundColor: Colors.indigo[200],
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
        title: Text('Home'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Hire()),
                  (Route<dynamic> route) => false);
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            label: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings, color: Colors.white),
              label: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),*/
      body: Container(
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg3.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: <Widget>[
            /* Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),*/
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: height * .2,
                    ),
                    Text(
                      'What are you looking for?',
                      style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Maidlist()),
                          );
                        },
                        child: Container(
                          child: Text('maid'),
                          height: 100.0,
                          width: 100.0,
                        ),
                      ),
                    ),
                    RaisedButton(
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Maidlist()),
                        );
                      },
                      padding: EdgeInsets.all(10.0),
                      //color: Color.fromRGBO(0, 160, 227, 1),
                      color: Colors.pink[200],
                      textColor: Colors.white,
                      child: Text('MAID', style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    RaisedButton(
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cooklist()),
                        );
                      },
                      padding: EdgeInsets.all(10.0),
                      //color: Color.fromRGBO(0, 160, 227, 1),
                      color: Colors.orange[200],
                      textColor: Colors.white,
                      child: Text('COOK', style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Babysitterlist()),
                        );
                      },
                      padding: EdgeInsets.all(10.0),
                      //color: Color.fromRGBO(0, 160, 227, 1),
                      color: Colors.blue[200],
                      textColor: Colors.white,
                      child:
                          Text('BABY SITTER', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}