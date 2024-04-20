// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore: unused_import
import 'package:baby_hub/screens/auth_ui/welcome.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: Get.height / 25),
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          backgroundColor: appConstant.appScendoryColor,
          child: Wrap(
            runSpacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Tanveer', style: TextStyle(color: appConstant.appTextColor) ),
                  subtitle: Text('version 1.0.0', style: TextStyle(color: appConstant.appTextColor) ),
                  leading: CircleAvatar(
                    radius: 22.0,
                    backgroundColor: appConstant.appMainColor,
                    child: Text("T",style: TextStyle(color: appConstant.appTextColor) ),
                  ),
                ),
              ),
              Divider(
                
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1.5,
                color: Colors.grey,
              ),
                 Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Home',style: TextStyle(color: appConstant.appTextColor) ),
                  leading:Icon(Icons.home,color: Colors.white),
                  trailing: Icon(Icons.arrow_forward),
                ),  
              ),
                  Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Production',style: TextStyle(color: appConstant.appTextColor) ),
                  leading:Icon(Icons.production_quantity_limits_rounded,color: Colors.white),
                  trailing: Icon(Icons.arrow_forward),
                ),  
              ),
                  Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Order',style: TextStyle(color: appConstant.appTextColor) ),
                  leading:Icon(Icons.shopping_bag,color: Colors.white),
                  trailing: Icon(Icons.arrow_forward),
                ),  
              ),
                    Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Contact',style: TextStyle(color: appConstant.appTextColor) ),
                  leading:Icon(Icons.help,color: Colors.white),
                  trailing: Icon(Icons.arrow_forward),
                ),  
              ),
                    Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0),
                child: ListTile(
                   onTap: () async {
              FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.signOut();
              Get.offAll(() => welCome());
            },
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Log Out',style: TextStyle(color: appConstant.appTextColor) ),
                  leading:Icon(Icons.logout,color: Colors.white),
                  trailing: Icon(Icons.arrow_forward),
                ),  
              ),
            ],
            
          ),
        ));
  }
}
