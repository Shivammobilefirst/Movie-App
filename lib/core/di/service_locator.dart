import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> configureDependencies() async {
  await ScreenUtil.ensureScreenSize();
}
