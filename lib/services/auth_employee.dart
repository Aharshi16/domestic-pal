import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _authEmployee = FirebaseAuth.instance;

  //sign in anon
  Future signInAnon() async{
    try{
      AuthResult result = await _authEmployee.signInAnonymously();
      FirebaseUser user=result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //sign out

  //register with email and password
}
