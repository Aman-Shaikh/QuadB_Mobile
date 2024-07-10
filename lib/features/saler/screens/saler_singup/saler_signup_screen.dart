import 'package:flutter/material.dart';
import 'package:quad_b/features/saler/screens/saler_singup/saler_form_header_widget.dart';
import 'package:quad_b/features/saler/screens/saler_singup/saler_signup_footer_widget.dart';
import 'package:quad_b/features/saler/screens/saler_singup/saler_signup_form_widget.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class WSignUpScreen extends StatelessWidget {
  const WSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(myDefaultSize),
            child: Column(
              children: const [
                WFormHeaderWidget(
                  image: myShopingBasketWithPhone,
                  title: mySignUpTitle,
                  subTitle: mySignUpSubTitle,
                  imageHeight: 0.15,
                ),
                WSignUpFormWidget(),
                WSignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
