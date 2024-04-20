import 'package:baby_hub/screens/auth_ui/sign_in.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  Future<void> ForgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: "Please wait");

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        "Request Sent Sucessfully",
        "Password reesr link sent to $userEmail",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appConstant.appScendoryColor,
        colorText: appConstant.appTextColor,
      );

      // ignore: prefer_const_constructors
      Get.offAll(() => signInScreen());

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appConstant.appScendoryColor,
        colorText: appConstant.appTextColor,
      );
    }
  }
}
