import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domestic_pal/models/user.dart';

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

  //employee details from snapshot
  List<EmployeeUserData> _employeeDetailsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return EmployeeUserData(
        name: doc.data['name'] ?? '',
        phoneNo: doc.data['phoneNo'] ?? 0,
        gender: doc.data['gender'] ?? '',
        location: doc.data['location'] ?? '',
        jobProfile: doc.data['jobProfile'] ?? '',
        workExperience: doc.data['workExperience'] ?? 0,
      );
    }).toList();
  }

  //get employeeCollection stream
  Stream<List<EmployeeUserData>> get empDetails {
    return employeeCollection.snapshots().map(_employeeDetailsFromSnapshot);
  }
}
