import 'package:baby_hub/controller/get%20_user_data.dart';
import 'package:baby_hub/controller/signin_controller.dart';
import 'package:baby_hub/screens/admin_penal/admin.dart';
import 'package:baby_hub/screens/auth_ui/forget_Pass.dart';
import 'package:baby_hub/screens/auth_ui/sign_up.dart';
import 'package:baby_hub/screens/user_panel/main-screen.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({super.key});

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            'Sign in',
            style: TextStyle(
                fontSize: 50,
                color: appConstant.appMainColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 110, 109, 109),
                  ),
                ]),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 0),
          child: Column(
            children: [
              isKeyboardVisible
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        Lottie.asset(
                          'assets/images/welcome.json',
                          height: 300,
                          width: 300,
                        )
                      ],
                    ),
              SizedBox(
                height: Get.height / 50,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Email,
                      cursorColor: appConstant.appScendoryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter your email",
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  )),
              SizedBox(
                height: Get.height / 80,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => TextFormField(
                          controller: Password,
                          obscureText: signInController.IsPasswordVisible.value,
                          cursorColor: appConstant.appScendoryColor,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Enter password",
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    signInController.IsPasswordVisible.toggle();
                                  },
                                  child:
                                      signInController.IsPasswordVisible.value
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility)),
                              contentPadding:
                                  EdgeInsets.only(top: 2.0, left: 8.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => forgetPassWord());
                  },
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 50,
              ),
              Material(
                child: Container(
                  width: Get.width / 3,
                  height: Get.height / 16,
                  decoration: BoxDecoration(
                      color: appConstant.appMainColor,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextButton(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: appConstant.appTextColor,
                          fontFamily: "Pacifico",
                          fontSize: 17,
                          fontWeight: FontWeight.w200),
                    ),
                    onPressed: () async {
                      String email = Email.text.trim();
                      String password = Password.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "please Enter all Detail",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: appConstant.appScendoryColor,
                          colorText: appConstant.appTextColor,
                        );
                      } else {
                        UserCredential? userCredential = await signInController
                            .signInMethod(email, password);

                        var userData = await getUserDataController
                            .getUserData(userCredential!.user!.uid);

                        // ignore: unnecessary_null_comparison
                        if (userCredential != null) {
                          if (userCredential.user!.emailVerified) {

                            if (userData[0]['isAdmin'] == true) {
                              Get.offAll(()=> adminScreen());
                                Get.snackbar(
                              "Admin",
                              "Login SuccessFully",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: appConstant.appScendoryColor,
                              colorText: appConstant.appTextColor,
                            );
                            } else {
                           Get.offAll(() => mainScreen());
                            Get.snackbar(
                              "Success",
                              "Login SuccessFully",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: appConstant.appScendoryColor,
                              colorText: appConstant.appTextColor,
                            );
                            }

                          
                          } else {
                            Get.snackbar(
                              "Error",
                              "Please verify Your Email",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: appConstant.appScendoryColor,
                              colorText: appConstant.appTextColor,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please TryAgain",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: appConstant.appScendoryColor,
                            colorText: appConstant.appTextColor,
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => signUpScreen()),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
