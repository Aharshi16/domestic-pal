import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //Employee collection reference
  final CollectionReference employeeCollection =
      Firestore.instance.collection('empDetails');

  Future updateUserData(
      String userCatagory,
      String name,
      int phoneNo,
      String gender,
      String location,
      int workExperience,
      int rating,
      String jobProfile) async {
    return await employeeCollection.document(uid).setData({
      'userCatagory': userCatagory,
      'name': name,
      'phoneNo': phoneNo,
      'gender': gender,
      'location': location,
      'workExperience': workExperience,
      'rating': rating,
      'jobProfile': jobProfile
    });
  }

  //get employeeCollection stream
  Stream<QuerySnapshot> get empDetails {
    return employeeCollection.snapshots();
  }
}
