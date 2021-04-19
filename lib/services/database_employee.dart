import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domestic_pal/models/user.dart';

class DatabaseEmployeeService {
  final String uid;
  DatabaseEmployeeService({this.uid});

  //Employee collection reference
  final CollectionReference employeeCollection =
      Firestore.instance.collection('empDetails');

  Future updateEmployeeUserData(
      String userCategory,
      String name,
      String phoneNo,
      String gender,
      String aadharNo,
      String location,
      String workExperience,
      int rating,
      String jobProfile) async {
    return await employeeCollection.document(uid).setData({
      'userCategory': userCategory,
      'name': name,
      'phoneNo': phoneNo,
      'gender': gender,
      'aadharNo': aadharNo,
      'location': location,
      'workExperience': workExperience,
      'rating': rating,
      'jobProfile': jobProfile
    });
  }

  //employee details from snapshot
  EmployeeUserData _employeeDetailsFromSnapshot(DocumentSnapshot snapshot) {
    return EmployeeUserData(
      //uid: snapshot.data['uid'],
      uid: uid,
      userCategory: snapshot.data['userCategory'],
      name: snapshot.data['name'],
      phoneNo: snapshot.data['phoneNo'],
      gender: snapshot.data['gender'],
      aadharNo: snapshot.data['aadharNo'],
      location: snapshot.data['location'],
      jobProfile: snapshot.data['jobProfile'],
      workExperience: snapshot.data['workExperience'],
    );
  }

  Stream<QuerySnapshot> get employees {
    return employeeCollection.snapshots();
  }

  //get employee doc stream
  Stream<EmployeeUserData> get empDetails {
    return employeeCollection
        .document(uid)
        .snapshots()
        .map(_employeeDetailsFromSnapshot);
  }
}
