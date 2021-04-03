/*import 'package:domestic_pal/screens/hire/hire.dart';
import 'package:domestic_pal/screens/home_customer/backup.dart';
import 'package:domestic_pal/screens/home_customer/update_details.dart';
import 'package:domestic_pal/screens/home_employee/home_employee.dart';
import 'package:domestic_pal/services/auth_customer.dart';
import 'package:flutter/material.dart';

class HomeCustomer extends StatefulWidget {
  @override
  _HomeCustomerState createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
  int index = 0;
  
  List<Widget> list = [
    HomeScreen(),
    UpdateCustomerDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[200],
          elevation: 0.0,
          title: Text('Customer Home Screen'),
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
  final AuthService _authService = AuthService();

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
              decoration: BoxDecoration(color: Colors.indigo[900]),
              child: Padding(
                padding: EdgeInsets.all(6.0),
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
                      'username',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'email of user',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home Screen'),
              onTap: () => onTap(context, 0),
            ),
            ListTile(
              leading: Icon(Icons.person_outlined),
              title: Text('View Details'),
              onTap: () => onTap(context, 1),
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              leading: FlatButton.icon(
                  onPressed: () async {
                    await _authService.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Hire()),
                        (Route<dynamic> route) => false);
                  },
                  icon: Icon(
                    Icons.person,
                  ),
                  label: Text(
                    'logout',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
*/