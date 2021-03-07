import 'package:domestic_pal/models/user.dart';
//import 'package:domestic_pal/screens/authenticate/authenticate_customer.dart';
//import 'package:domestic_pal/screens/authenticate/signin_customer.dart';
import 'package:domestic_pal/screens/hire/hire.dart';
//import 'package:domestic_pal/screens/home_customer/home_customer.dart';
//import 'package:domestic_pal/screens/home_employee/home_employee.dart';
import 'package:domestic_pal/screens/wrapper/check_user_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    /*if (user == null) {
      return Hire();
    } else {
      if (user.category == 'C') {
        return HomeCustomer();
      }
      return HomeEmployee();
    }*/

    return (user == null) ? Hire() : CheckUserType(user: user,);
  }
}
