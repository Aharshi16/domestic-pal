import 'package:domestic_pal/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _authEmployee = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, category: 'E') : null;
  }

  //auth changes user stream
  Stream<User> get user {
    return _authEmployee.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _authEmployee.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //register with email and password

  //Sign out
  Future signOut() async {
    try {
      return await _authEmployee.signOut();
    } catch (e) {
      print(e.toString);
      return null;
    }
  }
}
