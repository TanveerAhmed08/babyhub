import 'package:flutter/material.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:flutter/services.dart';


class adminScreen extends StatefulWidget {
  const adminScreen({super.key});

  @override
  State<adminScreen> createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        toolbarHeight: 70,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: appConstant.appStatusBarColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: appConstant.appMainColor,
        title: const Text(
          "Admin",
          style: TextStyle(
              color: appConstant.appTextColor,
              fontSize: 25,
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
    ));
  }
}