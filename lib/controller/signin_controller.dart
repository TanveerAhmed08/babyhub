import 'package:baby_hub/utils/app_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var IsPasswordVisible = false.obs;

  // ignore: body_might_complete_normally_nullable
  Future<UserCredential?> signInMethod(String Email, String Password) async {
    try {
      EasyLoading.show(status: "Please wait");

      UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: Email, password: Password);

      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appConstant.appScendoryColor,
          colorText: appConstant.appTextColor);
    }
  }
}
