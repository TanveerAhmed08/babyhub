// ignore: unused_import
import 'package:baby_hub/screens/auth_ui/welcome.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:baby_hub/widget/Category.dart';
import 'package:baby_hub/widget/flesh_sale.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:baby_hub/widget/banner_widget.dart';
import 'package:baby_hub/widget/custom_Ddrawer.dart';
import 'package:baby_hub/widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: appConstant.appTextColor),
        toolbarHeight: 70,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: appConstant.appStatusBarColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: appConstant.appMainColor,
        title: Text(
          appConstant.appMainName,
          style: TextStyle(
              color: appConstant.appTextColor,
              fontSize: 25,
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height /  90.0,
              ),
              BannerWidget(),
              headingWidget(
                headingTitle: "Categories",
                headingSubTitle: "Accoyding To your Budget",
                onTap: (){},
                buttonText: "See More",
              ),
              CategoeyWidget(),
                headingWidget(
                headingTitle: "Flesh Sale",
                headingSubTitle: "Accoyding To your Budget",
                onTap: (){},
                buttonText: "See More",
              ),
              fleshSaleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
