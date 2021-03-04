
import 'package:domestic_pal/screens/authenticate/authenticate_customer.dart';
import 'package:domestic_pal/screens/authenticate/signin_customer.dart';
import 'package:domestic_pal/screens/home_customer/home_customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domestic_pal/models/customer.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Customer>(context);
    print(user);

    return AuthenticateCustomer();
  }
}

