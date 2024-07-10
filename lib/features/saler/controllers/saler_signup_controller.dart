import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/saler_authentication_repository.dart';
import '../../../repository/user_repository/wholesaler_repository.dart';
import '../models/saler_model.dart';

class WSignUpController extends GetxController {
  static WSignUpController get instance => Get.find();

  var isLoading = false.obs;

//TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

//Call this Function from Design & it will do the rest
//   Future<void> registerSaler(String email, String password) async{
//     String? error =await AuthenticationRepository.instance.createSalerWithEmailAndPassword(email, password);
//     if (error != null)
//       {
//         Get.snackbar("Error :",error.toString(),
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.redAccent.withOpacity(0.1),
//             colorText: Colors.red);
//       }
//     else
//       {
//
//       }
//   }

  //Call this Function from Design & it will do the rest

  Future<void> registerSaler(SalerModel Saler) async {
    isLoading.value = true;
    String? error = await WAuthenticationRepository.instance
        .createSalerWithEmailAndPassword(
            Saler.email, Saler.password);
    if (error != null) {
      Get.snackbar("Error :", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      isLoading.value = false;
    } else {
      createSaler(Saler);
    }
  }

  // Get phoneNo from Saler and pass it to Auth Repository for firebase Authentication
  void phoneAuthentication(String phoneNo) {
    WAuthenticationRepository.instance.wPhoneAuthentication(phoneNo);
  }

  //creating Saler storing Salers data in database
  final SalerRepo = Get.put(SalerRepository());

  Future<void> createSaler(SalerModel Saler) async {
    await SalerRepo.createSaler(Saler);
    isLoading.value = false;
    // do work after creation of Saler

    // for email and password authentication
    // registerSaler(Saler.email,Saler.password);

    // for phone authentication
    // phoneAuthentication(Saler.phoneNo);
    // Get.to(() => const OTPScreen());
  }

  Future<void> registerSalerWithGoogle() async {
    String? error =
        await WAuthenticationRepository.instance.wSignInWithGoogle();
    if (error != null) {
      Get.snackbar("Error :", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    } else {
      final Saler = SalerModel(
          email: FirebaseAuth.instance.currentUser!.email!,
          password: "Amanshaikh123#\$",
          fullName: FirebaseAuth.instance.currentUser!.displayName!);
      createSaler(Saler);
    }
  }
}
