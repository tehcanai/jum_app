import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';

class UserController extends RxController {
  User? user;
  UserCredential? credential;
  String? token = '';

  @override
  void onInit() {
    super.onInit();
    user = FirebaseAuth.instance.currentUser;
    initToken();
  }

  Future<void> initToken() async {
    token = await user?.getIdToken();
  }
}
