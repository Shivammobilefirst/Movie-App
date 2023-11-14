import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveScaleWidget extends StatelessWidget {
  const ResponsiveScaleWidget({
    required this.child,
    this.scale,
    super.key,
  });

  final Widget child;
  final double? scale;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale ?? 0.9.sp,
      child: child,
    );
  }
}
