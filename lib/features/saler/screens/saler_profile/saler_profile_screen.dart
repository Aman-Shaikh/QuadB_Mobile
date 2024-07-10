import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:quad_b/features/saler/screens/saler_profile/saler_profile_menu_widget.dart';
import 'package:quad_b/features/saler/screens/saler_profile/saler_update_profile_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../repository/authentication_repository/saler_authentication_repository.dart';
import '../../controllers/saler_profile_controller.dart';
import '../../models/saler_model.dart';
import '../saler_home/wholesaler_appbar_widget.dart';
import '../saler_messages/saler_messages_screen.dart';
import '../saler_shop_setting/saler_shop_setting.dart';

class SalerProfileScreen extends StatelessWidget {
  const SalerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(WProfileController());
    
    return Scaffold(
      appBar: WAppBarWidget("Saler Profile"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(myDefaultSize),
          child: FutureBuilder(
            future: controller.getSalerData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  SalerModel SalerData =
                      snapshot.data as SalerModel;

                  //TextField Controllers to get data from TextFields
                  final email =
                      TextEditingController(text: SalerData.email).obs;
                  final fullName =
                      TextEditingController(text: SalerData.fullName);
                  final imageLink = SalerData.imageLink;

                  return Obx(()=>Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: imageLink==null? Image(
                                      image: AssetImage(
                                          myShopingBasketWithPhone)):Image.network(imageLink!)),
                            ),
                            // Positioned(
                            //   bottom: 0,
                            //   right: 0,
                            //   child: Container(
                            //       width: 35,
                            //       height: 35,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(100),
                            //         color: myPrimaryColor,
                            //       ),
                            //       child: const Icon(
                            //         LineAwesomeIcons.alternate_pencil,
                            //         color: Colors.black,
                            //         size: 20,
                            //       )
                            //   ),
                            // )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(fullName.text,
                            style: Theme.of(context).textTheme.headlineMedium),
                        Text(email.value.text,
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => WUpdateProfileScreen()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: myPrimaryColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(myEditProfile,
                                style: TextStyle(color: myDarkColor)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Divider(),
                        const SizedBox(height: 10),

                        // MENU
                        WProfileMenuWidget(
                            title: "Shop Settings",
                            icon: LineAwesomeIcons.cog,
                            onPress: () {
                              Get.to(() => const WShopSetting());
                            }),
                        WProfileMenuWidget(
                            title: "messages",
                            icon: Icons.chat,
                            onPress: () {
                              Get.to(() => const WMessagesScreen());
                            }),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 10),
                        WProfileMenuWidget(
                            title: "LogOut",
                            icon: LineAwesomeIcons.alternate_sign_out,
                            textColor: Colors.red,
                            onPress: () {
                              WAuthenticationRepository.instance.wLogOut();
                              Get.snackbar(
                                  "Success", "you are logged out successfully.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green.withOpacity(0.1),
                                  colorText: Colors.green);
                            }),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text("Something went wrong"));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
