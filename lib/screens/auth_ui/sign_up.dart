import 'package:baby_hub/controller/signup_controller.dart';
import 'package:baby_hub/screens/auth_ui/sign_in.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:lottie/lottie.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
         appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            'Sign up',
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: Name,
                        cursorColor: appConstant.appScendoryColor,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.person),
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )),
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
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )),
                SizedBox(
                  height: Get.height / 50,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: Phone,
                        cursorColor: appConstant.appScendoryColor,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Phone",
                            prefixIcon: Icon(Icons.phone),
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )),
                SizedBox(
                  height: Get.height / 50,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: City,
                        cursorColor: appConstant.appScendoryColor,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            hintText: "City",
                            prefixIcon: Icon(Icons.location_city),
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )),
                SizedBox(
                  height: Get.height / 50,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => TextFormField(
                            controller: Password,
                            obscureText:
                                signUpController.IsPasswordVisible.value,
                            cursorColor: appConstant.appScendoryColor,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.password),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    signUpController.IsPasswordVisible.toggle();
                                  },
                                  child:
                                      signUpController.IsPasswordVisible.value
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                ),
                                contentPadding:
                                    EdgeInsets.only(top: 2.0, left: 8.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                        ))),
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
                        "Sign up",
                         style: TextStyle(
                          color: appConstant.appTextColor,
                          fontFamily: "Pacifico",
                          fontSize: 17,
                          fontWeight: FontWeight.w200),
                      ),
                      onPressed: () async {
                        String name = Name.text.trim();
                        String email = Email.text.trim();
                        String phone = Phone.text.trim();
                        String city = City.text.trim();
                        String password = Password.text.trim();
                        String userDeviceToken = '';

                        if (name.isEmpty ||
                            email.isEmpty ||
                            phone.isEmpty ||
                            city.isEmpty ||
                            password.isEmpty) {
                          Get.snackbar("Error", "invalid Feild",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: appConstant.appScendoryColor,
                              colorText: appConstant.appTextColor);
                        } else {
                          UserCredential? userCredential =
                              await signUpController.signUpMethod(name, email,
                                  phone, city, password, userDeviceToken);
                          if (userCredential != null) {
                            Get.snackbar("Verification Email Sent",
                                "please Check Your Email",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: appConstant.appScendoryColor,
                                colorText: appConstant.appTextColor);
                            FirebaseAuth.instance.signOut();
                            Get.offAll(() => signInScreen());
                          } 
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => signInScreen()),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
