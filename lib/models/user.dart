class User {
  final String uid;
  final String category;
  User({this.uid, this.category});
}

class CustomerUserData {
  final String name;
  final String phone;
  final String city;

  CustomerUserData({this.name, this.phone, this.city});
}

class EmployeeUserData {
  final String name;
  final int phoneNo;
  final String gender;
  final String location;
  final int workExperience;
  final String jobProfile;

  EmployeeUserData(
      {this.name,
      this.phoneNo,
      this.gender,
      this.location,
      this.jobProfile,
      this.workExperience});
}
