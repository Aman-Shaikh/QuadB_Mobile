import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../saler_login/saler_login_screen.dart';

class WSignUpFooterWidget extends StatelessWidget {
  const WSignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        // const SizedBox(height: myFormHeight - 20),
        // SizedBox(
        //   width: double.infinity,
        //   child: OutlinedButton.icon(
        //     onPressed: () {
        //       WSignUpController.instance.registerSalerWithGoogle();
        //     },
        //     icon: const Image(
        //       image: AssetImage(myGoogleLogo),
        //       width: 20.0,
        //     ),
        //     label: Text(mySignInWithGoogle.toUpperCase()),
        //   ),
        //
        // ),
        const SizedBox(height: myFormHeight - 20),
        TextButton(
          onPressed: () {
            Get.offAll(const WLoginScreen());
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: myAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(text: myLogin.toUpperCase())
          ])),
        )
      ],
    );
  }
}
