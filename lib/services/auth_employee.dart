import 'package:domestic_pal/models/employee.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _authEmployee = FirebaseAuth.instance;
  //create user obj based on FirebaseUser
  Employee_userFromFirebaseUser(FirebaseUser user){
    return user != null ? Employee(uid: user.uid): null;
  }
  //sign in anon
  Future signInAnon() async{
    try{
      AuthResult result = await _authEmployee.signInAnonymously();
      FirebaseUser user=result.user;
      return Employee_userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //sign out

  //register with email and password
}
