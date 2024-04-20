// ignore_for_file: unused_import

import 'dart:async';
import 'package:baby_hub/controller/get%20_user_data.dart';
import 'package:baby_hub/screens/admin_penal/admin.dart';
import 'package:baby_hub/screens/auth_ui/welcome.dart';
import 'package:baby_hub/screens/user_panel/main-screen.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class spleshScreen extends StatefulWidget {
  const spleshScreen({super.key});

  @override
  State<spleshScreen> createState() => _spleshScreenState();
}

class _spleshScreenState extends State<spleshScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      login(context);
    });
  }

  Future<void> login(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
          var userData = await  getUserDataController.getUserData(user!.uid);

          if (userData [0] ['isAdmin']== true) {
            Get.offAll(()=> adminScreen());
          }else{
            Get.offAll(()=> mainScreen());
          }
    } else {
      Get.to(() => welCome());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appConstant.appScendoryColor,
      appBar: AppBar(
        backgroundColor: appConstant.appScendoryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset("assets/images/splash_icon.json"),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20.0),
                width: Get.width,
                alignment: Alignment.center,
                child: Text(
                  appConstant.appPoweredBy,
                  style: const TextStyle(
                      color: appConstant.appTextColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
