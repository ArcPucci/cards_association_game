import 'package:association_card_game/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.text,
    this.onTap,
    this.width,
    this.height,
    this.enabled = true,
  });

  final bool enabled;
  final String text;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Opacity(
        opacity: enabled ? 1 : 0.5,
        child: Container(
          width: width ?? 224.w,
          height: height ?? 68.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(85),
            gradient: AppColors.gradient3,
            boxShadow: const [AppColors.boxShadow5],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyleHelpers.textStyle3,
            ),
          ),
        ),
      ),
    );
  }
}
