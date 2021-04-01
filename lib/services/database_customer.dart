import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseCustomerService {
  final String uid;
  DatabaseCustomerService({this.uid});

  //collection reference
  final CollectionReference customerCollection =
      Firestore.instance.collection('customers');
  Future updateCustomerUserData(String userCatagory, String name, String phone, String city) async {
    return await customerCollection
        .document(uid)
        .setData({'userCatagory': userCatagory, 'name': name, 'phone': phone, 'city': city});
  }
}
