import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StarContainer extends StatelessWidget {
  final Widget? widget;
  const StarContainer({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 13.w,
      width: 13.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.0,
          color: AppColors.containerStarColor,
        ),
      ),
      child: FittedBox(fit: BoxFit.fill, child: widget),
    );
  }
}
