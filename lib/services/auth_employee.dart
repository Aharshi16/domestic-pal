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

  //sign in with email and password
  Future signInWithEmailAndPasswordEmployee(
      String email, String password) async {
    try {
      AuthResult result = await _authEmployee.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPasswordEmployee(
      String email, String password) async {
    try {
      AuthResult result = await _authEmployee.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

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
