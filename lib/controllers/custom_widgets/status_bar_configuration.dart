import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/custom_models/color_constraints.dart';

class StatusBarConfiguration{
  static Widget statusBarConfiguration({required Widget child}) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.blackishColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.blackishColor,
      ),
      child: child,
    );
  }
}
