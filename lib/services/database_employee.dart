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
  EmployeeUserData _employeeDetailsFromSnapshot(DocumentSnapshot snapshot) {
    return EmployeeUserData(
      name: snapshot.data['name'] ?? '',
      phoneNo: snapshot.data['phoneNo'] ?? 0,
      gender: snapshot.data['gender'] ?? '',
      location: snapshot.data['location'] ?? '',
      jobProfile: snapshot.data['jobProfile'] ?? '',
      workExperience: snapshot.data['workExperience'] ?? 0,
    );
  }

  //get employeeCollection stream
  Stream<EmployeeUserData> get empDetails {
    return employeeCollection
        .document(uid)
        .snapshots()
        .map(_employeeDetailsFromSnapshot);
  }
}
