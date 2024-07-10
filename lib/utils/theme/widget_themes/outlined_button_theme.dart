import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class MyOutlinedButtonTheme{
  /* -- Light theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: mySecondaryColor,
        side: BorderSide (color: mySecondaryColor),
        padding: EdgeInsets.symmetric (vertical: myButtonHeight),
      ),
  );

  /* -- Dark theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: myWhiteColor,
      side: BorderSide (color: myWhiteColor),
      padding: EdgeInsets.symmetric (vertical: myButtonHeight),
    ),
  );

}