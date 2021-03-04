import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/screens/authenticate/authenticate_customer.dart';
import 'package:domestic_pal/screens/authenticate/signin_customer.dart';
import 'package:domestic_pal/screens/hire/hire.dart';
import 'package:domestic_pal/screens/home_customer/home_customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    return (user == null) ? Hire() : HomeCustomer();
  }
}
