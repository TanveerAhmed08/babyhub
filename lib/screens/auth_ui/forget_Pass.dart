import 'package:baby_hub/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../../controller/forgetpasswordcon.dart';

class forgetPassWord extends StatefulWidget {
  const forgetPassWord({super.key});

  @override
  State<forgetPassWord> createState() => _forgetPassWordState();
}

class _forgetPassWordState extends State<forgetPassWord> {
  final ForgetPasswordController fotgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController Email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            'Forget password',
            style: TextStyle(
                fontSize: 40,
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
          child: Column(
            children: [
           
            
                
              SizedBox(
                height: Get.height / 10,
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
                height: Get.height / 30,
              ),
              Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 16,
                  decoration: BoxDecoration(
                      color: appConstant.appMainColor,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextButton(
                    child: Text(
                      "Reset password",
                        style: TextStyle(
                          color: appConstant.appTextColor,
                          fontFamily: "Pacifico",
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    ),
                    onPressed: () async {
                      String email = Email.text.trim();

                      if (email.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "please Enter all Detail",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: appConstant.appScendoryColor,
                          colorText: appConstant.appTextColor,
                        );
                      } else {
                        String email = Email.text.trim();
                        fotgetPasswordController.ForgetPasswordMethod(email);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
