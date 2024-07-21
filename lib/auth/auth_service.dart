import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (err) {
      throw Exception(err.code);
    }
  }

  Future<void> signout() async {
    return await _auth.signOut();
  }

  Future<UserCredential> signupWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
          return userCredential;
    } on FirebaseAuthException catch (err) {
      throw Exception(err.code);
    }
  }
}
