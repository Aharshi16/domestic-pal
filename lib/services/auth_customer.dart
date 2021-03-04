
import 'package:domestic_pal/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _authCustomer = FirebaseAuth.instance;

  //create user object on FIrebaeUser
  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid, category:'C') : null;
  }

  //auth changes user stream
  Stream<User> get user {
    return _authCustomer.onAuthStateChanged
      .map(_userFromFirebase);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _authCustomer.signInAnonymously();
      FirebaseUser user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with emial and password

  //register ith email password

  //sign out

}
