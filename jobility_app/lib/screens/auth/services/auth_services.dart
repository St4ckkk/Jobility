import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
      });

      return UserModel(
        uid: userCredential.user!.uid,
        email: email,
        name: 'DefaultName',
        role: 'DefaultRole',
      );
    } on FirebaseAuthException catch (e) {
      // Improved error logging
      print("Error during sign up: ${e.code} - ${e.message}");
      return null;
    }
  }
}
