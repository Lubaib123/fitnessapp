import 'package:fitapp/src/app/themes/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  TextStyle heading1 = GoogleFonts.inter(
    fontSize: 28,
    color: AppPalette.black,
    fontWeight: FontWeight.w700,
  );

  TextStyle heading2 = GoogleFonts.inter(
    fontSize: 24,
    color: AppPalette.black,
    fontWeight: FontWeight.w700,
  );

  TextStyle heading3 = GoogleFonts.inter(
    fontSize: 20,
    color: AppPalette.black,
    fontWeight: FontWeight.w700,
  );

  TextStyle heading4 = GoogleFonts.inter(
    fontSize: 18,
    color: AppPalette.black,
    fontWeight: FontWeight.w700,
  );

  TextStyle heading5 = GoogleFonts.inter(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  TextStyle subheading1 = GoogleFonts.inter(
    fontSize: 16,
    color: AppPalette.black,
    fontWeight: FontWeight.w600,
  );

  TextStyle subheading2 = GoogleFonts.inter(
    fontSize: 14,
    color: AppPalette.black,
  );

  TextStyle subheading3 = GoogleFonts.inter(
    fontSize: 14,
    color: AppPalette.black,
    fontWeight: FontWeight.w500,
  );

  TextStyle body1 = GoogleFonts.inter(
    fontSize: 16,
    color: AppPalette.black,
    fontWeight: FontWeight.w400,
  );

  TextStyle body2 = GoogleFonts.inter(
    fontSize: 14,
    color: AppPalette.black,
    fontWeight: FontWeight.w400,
  );

  TextStyle caption1 = GoogleFonts.inter(
    fontSize: 12,
    color: AppPalette.black,
    fontWeight: FontWeight.w400,
  );

  TextStyle captionmedium = GoogleFonts.inter(
    fontSize: 10,
    color: AppPalette.black,
    fontWeight: FontWeight.w400,
  );
}
