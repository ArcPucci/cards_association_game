import 'package:association_card_game/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
    this.width,
    this.height,
    this.selected = false,
    this.borderRadius = 18,
  });

  final String text;
  final double? width;
  final double? height;
  final String? icon;
  final VoidCallback? onTap;
  final bool selected;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: width ?? 144.w,
            height: height ?? 68.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: selected ? AppColors.gradient3 : AppColors.gradient2,
              boxShadow: [
                selected ? AppColors.boxShadow5 : AppColors.boxShadow4
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Padding(
                    padding: EdgeInsets.only(right: 3.w),
                    child: Image.asset(
                      icon!,
                      width: 28.r,
                      height: 28.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                Text(
                  text,
                  style: TextStyleHelpers.textStyle3,
                ),
              ],
            ),
          ),
          Visibility(
            visible: selected,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(18),
              ),
              child: Image.asset(
                Images.angle,
                width: 59.w,
                height: 48.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
