
import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class WLoginHeaderWidget extends StatelessWidget {
  const WLoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage(myShopingBasketWithPhone),
            height: size.height * 0.2),
        Text(myLoginTitle, style: Theme.of(context).textTheme.displaySmall),
        Text(myLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
