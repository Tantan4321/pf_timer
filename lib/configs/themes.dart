import 'package:flutter/material.dart';
import 'package:pf_timer/configs/AppColors.dart';

class AppThemes {
  static ThemeData kIOSTheme = new ThemeData(
    primarySwatch: Colors.red,
    primaryColor: AppColors.coralRed,
    accentColor: AppColors.mikadoYellow,
    cardColor: AppColors.gunmetal,
    primaryColorBrightness: Brightness.light,
  );

  static ThemeData kDefaultTheme = new ThemeData(
    primarySwatch: Colors.red,
    primaryColor: AppColors.coralRed,
    accentColor: AppColors.mikadoYellow,
    cardColor: AppColors.gunmetal,
  );
}
