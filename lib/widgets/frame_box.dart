import 'package:association_card_game/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FrameBox extends StatelessWidget {
  const FrameBox({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.hasPadding = true,
  });

  final double? width;
  final double? height;
  final Widget child;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 176.w,
      height: height ?? 88.h,
      decoration: BoxDecoration(
        color: AppColors.blue4,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 4,
          color: AppColors.blue1,
        ),
        boxShadow: [AppColors.boxShadow3],
      ),
      padding: hasPadding ? EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.h,
      ) : EdgeInsets.zero,
      child: child,
    );
  }
}
