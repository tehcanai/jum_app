import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';

class AuthController extends RxController {
  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, dynamic> data = {};

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      data['success'] = true;
      data['user'] = credential;
      data['message'] = 'User logged in successfully.';
    } on FirebaseAuthException catch (e) {
      data['success'] = false;
      if (e.code == 'user-not-found') {
        data['error'] = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        data['error'] = 'Wrong password provided for that user.';
      }
    }

    return data;
  }

  Future<Map<String, dynamic>> register(String email, String password) async {
    Map<String, dynamic> data = {};

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      data['success'] = true;
      data['user'] = credential;
      data['message'] = 'User created successfully.';
    } on FirebaseAuthException catch (e) {
      data['success'] = false;
      if (e.code == 'weak-password') {
        data['error'] = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        data['error'] = 'The account already exists for that email.';
      }
    }

    return data;
  }

  Future<Map<String, dynamic>> logout() async {
    Map<String, dynamic> data = {};

    try {
      await FirebaseAuth.instance.signOut();

      data['success'] = true;
      data['message'] = 'User logged out successfully.';
    } on FirebaseAuthException catch (e) {
      data['success'] = false;
      data['error'] = e.code;
    }

    return data;
  }
}
