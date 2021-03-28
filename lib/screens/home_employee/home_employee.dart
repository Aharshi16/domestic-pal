import 'package:domestic_pal/screens/home_employee/update.dart';
import 'package:domestic_pal/screens/home_employee/view.dart';
import 'package:domestic_pal/screens/hire/hire.dart';
import 'package:domestic_pal/services/auth_employee.dart';
import 'package:flutter/material.dart';

/*class HomeEmployee extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text('Employee home screen'),
        backgroundColor: Colors.cyan[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              print("logged out of employee");
              await _auth.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Hire()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}*/
class HomeEmployee extends StatefulWidget {
  @override
  _home_employeeState createState() => _home_employeeState();
}

class _home_employeeState extends State<HomeEmployee> {
  int index = 0;
  List<Widget> list = [
    ViewDetails(),
    UpdateDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Navigation Drawer"),
        ),
        body: list[index],
        drawer: MyDrawer(
          onTap: (ctx, i) {
            setState(() {
              index = i;
              Navigator.pop(ctx);
            });
          },
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;
  final AuthService _auth = AuthService();

  MyDrawer({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Username from firebase',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Mail ID from firebase',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text('View Details'),
              onTap: () => onTap(context, 0),
            ),
            ListTile(
              leading: Icon(Icons.update_outlined),
              title: Text('Update Details'),
              onTap: () => onTap(context, 1),
            ),
            Divider(height: 1),
            ListTile(
                leading: FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                print("logged out of employee");
                await _auth.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Hire()),
                    (Route<dynamic> route) => false);
              },
            )),
          ],
        ),
      ),
    );
  }
}
