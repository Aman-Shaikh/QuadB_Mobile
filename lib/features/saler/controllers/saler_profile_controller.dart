import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../repository/authentication_repository/saler_authentication_repository.dart';
import '../../../repository/user_repository/wholesaler_repository.dart';
import '../models/saler_model.dart';


class WProfileController extends GetxController {
  static WProfileController get instance => Get.find();

  //Repositories
  final _authRepo = Get.put(WAuthenticationRepository());
  final _SalerRepo = Get.put(SalerRepository());
  var isLoading = false.obs;
  var wImage=null;
  var imageChanged=false.obs;
  var imageLink=null;

  // Get Saler email and pass to SalerRepository to fetch Saler record.
  getSalerData() {
    final email = _authRepo.firebaseUser.value?.email;

    if (email != null) {
      return _SalerRepo.getSalerDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  //fetch list of Saler records
  Future<List<SalerModel>> getAllSalers() async => await _SalerRepo.allSalers();

  updateRecord(SalerModel Saler) async {

    await _SalerRepo.updateSalerRecord(Saler);

  }

  pickSalerImage() async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (img == null) {
       imageChanged.value = false;
        return;
      }
      else {
        imageChanged.value = false;
        wImage = File(img.path);
        imageChanged.value = true;
      }
    } catch (e) {
      imageChanged.value = false;
      Get.snackbar("Error :",e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }

  uploadSalerImage() async{
      if(wImage!=null){

        var filename = basename(wImage.path);
        var destination = 'images/vendors/${FirebaseAuth.instance.currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(wImage);
        imageLink = await ref.getDownloadURL();

      }
  }



}
