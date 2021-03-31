import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //Employee collection reference
  final CollectionReference employeeCollection =
      Firestore.instance.collection('empDetails');
}
