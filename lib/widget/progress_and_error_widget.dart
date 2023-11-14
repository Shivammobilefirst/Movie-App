import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/app_sizes.dart';
import 'package:movie_app/core/models/status.dart';
import 'package:movie_app/widget/responsive_scale_widget.dart';

class ProgressAndErrorWidget extends StatelessWidget {
  const ProgressAndErrorWidget({
    required this.status,
    required this.errorMessage,
    this.onRefresh,
    super.key,
  });

  final Status status;
  final String errorMessage;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return status.isFailed
        ? RefreshIndicator(
            onRefresh: () async {
              onRefresh?.call();
            },
            child: SizedBox(
              height: 1.sh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.large),
                  width: 1.sw,
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        : SizedBox(
            height: 0.08.sh,
            child: const Center(
              child: ResponsiveScaleWidget(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          );
  }
}
