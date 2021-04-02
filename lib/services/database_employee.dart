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

<<<<<<< HEAD
  //get employee stream
=======
  //get employeeCollection stream
>>>>>>> f2468b6a0376201423d7934e6e5e34023e340d33
  Stream<QuerySnapshot> get empDetails {
    return employeeCollection.snapshots();
  }
}


