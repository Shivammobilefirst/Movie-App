import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/styles/app_colors.dart';

bool isProgressDialogShowing = false;

Future<dynamic> showProgressDialogue(BuildContext context) {
  isProgressDialogShowing = true;
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Container(
        width: 60.sp,
        height: 60.sp,
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const FittedBox(child: CircularProgressIndicator.adaptive()),
      ),
    ),
  );
}
