import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  User? _user = FirebaseAuth.instance.currentUser;

  set setUser(User? user) {
    _user = user;
  }

  User? get user => _user;
}
