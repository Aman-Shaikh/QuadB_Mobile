
import 'package:get/get.dart';

import '../../../repository/authentication_repository/saler_authentication_repository.dart';
import '../screens/saler_home/saler_home_screen.dart';


class WOTPController extends GetxController {
  static WOTPController get instance => Get.find();

  //this function should be called from otp_screen
  void verifyOTP(String otp) async {
    var isVerified = await WAuthenticationRepository.instance.wVerifyOTP(otp);
    isVerified ? Get.offAll(const SalerHomeScreen()) : Get.back();
  }


}