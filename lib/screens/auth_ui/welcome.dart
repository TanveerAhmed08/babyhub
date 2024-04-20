// ignore: unused_import
import 'package:baby_hub/screens/auth_ui/sign_in.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class welCome extends StatelessWidget {
  const welCome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Welcome",
          style: TextStyle(
            color: appConstant.appMainColor,
            fontSize: 70,
            fontWeight: FontWeight.bold,
            fontFamily: "Pacifico",
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 5.0,
                color: Color.fromARGB(255, 110, 109, 109),
              ),
              // Shadow(
              //   offset: Offset(.0, 10.0),
              //   blurRadius: 8.0,
              //   color: Color.fromARGB(125, 0, 0, 255),
              // ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset("assets/images/welcome.json"),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 20.0),
            //   child: Text(
            //     "Happy Shopping",
            //     style: TextStyle(
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.bold,
            //       shadows: [
            //         Shadow(
            //           blurRadius: 10.0, // shadow blur
            //           color: Colors.grey, // shadow color
            //           offset: Offset(2.0, 2.0), // how much shadow will be shown
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: Get.height / 15,
            ),
            Material(
              child: Container(
                width: Get.width / 1.1,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextButton.icon(
                  icon: Image.asset(
                    "assets/images/google.png",
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),
                  label: Text(
                    "Sign in with goggle",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            Material(
              child: Container(
                width: Get.width / 1.1,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextButton.icon(
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Sign in with Email",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Get.to(() => signInScreen());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
