import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/saler/models/saler_model.dart';

class SalerRepository extends GetxController {
  static SalerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // -- Storing data
  createSaler(SalerModel Saler) async {
    await _db
        .collection("Salers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(Saler.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error",
          "User Authentication has been successfull but was not added into databse.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  // fetch Saler details
  Future<SalerModel> getSalerDetails(String email) async {
    final snapshot = await _db
        .collection("Salers")
        .where("Email", isEqualTo: email)
        .get();

    final SalerData =
        snapshot.docs.map((e) => SalerModel.fromSnapshot(e)).single;
    return SalerData;
  }

  // fetch all Salers
  Future<List<SalerModel>> allSalers() async {
    final snapshot = await _db.collection("Salers").get();

    final SalerData =
        snapshot.docs.map((e) => SalerModel.fromSnapshot(e)).toList();
    return SalerData;
  }

  Future<void> updateSalerRecord(SalerModel Saler) async {
    await _db
        .collection("Salers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(Saler.toJson())
        .whenComplete(
          () {
            Get.snackbar(
                "Success", "Your account has been Edited Successfully.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green);
            print("Profile Updated");

          })
        .catchError((error, stackTrace) {
      Get.snackbar("Error",
          "Something went wrong please check Saler repository file.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });

  }
}
