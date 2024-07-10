import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class MyElevatedButtonTheme{
  /* -- Light theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: myWhiteColor,
      backgroundColor: mySecondaryColor,
      side: BorderSide (color: mySecondaryColor),
      padding: EdgeInsets.symmetric (vertical: myButtonHeight),
    ),
  );

  /* -- Dark theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: mySecondaryColor,
      backgroundColor: myWhiteColor,
      side: BorderSide (color: mySecondaryColor),
      padding: EdgeInsets.symmetric (vertical: myButtonHeight),
    ),
  );

}