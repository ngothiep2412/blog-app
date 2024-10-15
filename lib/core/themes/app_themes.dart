import 'package:blog_app/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  AppThemes._();

  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: FlavorConfig.instance.variables['primaryColor']),
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.secondaryColor),
    useMaterial3: false,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}
