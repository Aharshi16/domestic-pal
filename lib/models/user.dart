class User {
  final String uid;
  final String category;
  User({this.uid, this.category});
}

class CustomerUserData {
  final String uid;
  final String userCategory;
  final String name;
  final String phone;
  final String city;

  CustomerUserData(
      {this.uid, this.userCategory, this.name, this.phone, this.city});
}

class EmployeeUserData {
  final String uid;
  final String userCategory;
  final String name;
  final int phoneNo;
  final String gender;
  final String location;
  final int workExperience;
  final String jobProfile;

  EmployeeUserData(
      {this.uid,
      this.userCategory,
      this.name,
      this.phoneNo,
      this.gender,
      this.location,
      this.jobProfile,
      this.workExperience});
}
