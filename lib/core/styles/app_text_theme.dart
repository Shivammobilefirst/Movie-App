import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/styles/app_colors.dart';

final appTextTheme = TextTheme(
  displayLarge: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 50.sp,
    height: 64 / 57,
    letterSpacing: -0.25,
    color: AppColors.black,
  ),
  displayMedium: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 40.sp,
    height: 52 / 45,
    color: AppColors.black,
  ),
  displaySmall: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 32.sp,
    height: 44 / 36,
    color: AppColors.black,
  ),
  headlineLarge: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w800,
    fontSize: 28.sp,
    height: 40 / 32,
    color: AppColors.blackVariant1,
  ),
  headlineMedium: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w800,
    fontSize: 26.sp,
    height: 36 / 28,
    color: AppColors.black,
  ),
  headlineSmall: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w800,
    fontSize: 22.sp,
    height: 32 / 24,
    color: AppColors.black,
  ),
  titleLarge: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    height: 28 / 22,
    color: AppColors.black,
  ),
  titleMedium: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w800,
    fontSize: 16.sp,
    height: 24 / 16,
    letterSpacing: 0.1,
    color: AppColors.black,
  ),
  titleSmall: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: AppColors.black,
  ),
  labelLarge: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    height: 20 / 14,
    color: AppColors.grey,
  ),
  labelMedium: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    height: 16 / 12,
    color: AppColors.grey,
  ),
  labelSmall: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    height: 16 / 11,
    color: AppColors.grey,
  ),
  bodyLarge: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
    height: 24 / 16,
    color: AppColors.grey,
  ),
  bodyMedium: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    height: 20 / 14,
    color: AppColors.grey,
  ),
  bodySmall: GoogleFonts.roboto().copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 16 / 12,
    color: AppColors.grey,
  ),
);
