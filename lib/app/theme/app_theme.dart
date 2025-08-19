import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkBase,
  cardColor: AppColors.secondaryDark,
  primaryColor: AppColors.neonPurple,
  colorScheme: ColorScheme.dark(
    primary: AppColors.neonPurple,
    secondary: AppColors.lightPurple,
    error: AppColors.neonPink,
    onPrimary: AppColors.primaryText,
  ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.roboto(color: AppColors.primaryText),
    bodyMedium: GoogleFonts.roboto(color: AppColors.secondaryText),
    bodySmall: GoogleFonts.roboto(color: AppColors.disabledText),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.neonPurple),
      foregroundColor: MaterialStateProperty.all(AppColors.primaryText),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )),
    ),
  ),
);
