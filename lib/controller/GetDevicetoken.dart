import 'package:baby_hub/utils/app_constant.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;
  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }
}

Future<void> getDeviceToken() async {
  try {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
    
    }
  } catch (e) {
    Get.snackbar("Error", "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appConstant.appScendoryColor,
        colorText: appConstant.appTextColor);
  }
}
