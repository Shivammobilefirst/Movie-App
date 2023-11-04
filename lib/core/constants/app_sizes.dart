import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  AppSizes._();

  static const large = 16.0;
  static const medium = 8.0;
  static const small = 4.0;
}

final gapHLarge = SizedBox(height: AppSizes.large.sp);
final gapHMedium = SizedBox(height: AppSizes.medium.sp);
final gapHSmall = SizedBox(height: AppSizes.small.sp);

final gapWLarge = SizedBox(width: AppSizes.large.sp);
final gapWMedium = SizedBox(width: AppSizes.medium.sp);
final gapWSmall = SizedBox(width: AppSizes.small.sp);
