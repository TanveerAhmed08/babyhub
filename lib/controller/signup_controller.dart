import 'package:baby_hub/models/user_model.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var IsPasswordVisible = false.obs;

  // ignore: body_might_complete_normally_nullable, non_constant_identifier_names
  Future<UserCredential?> signUpMethod(String Name, String Email, String Phone,
      // ignore: non_constant_identifier_names
      String City, String Password, String DeviceTocken) async {
    try {
      EasyLoading.show(status: "Please wait");

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: Email, password: Password);
      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: Name,
          email: Email,
          phone: Phone,
          userImg: '',
          userDeviceToken: DeviceTocken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: City);

      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());

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
