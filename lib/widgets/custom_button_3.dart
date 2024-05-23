import 'package:association_card_game/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton3 extends StatelessWidget {
  const CustomButton3({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
    this.width,
    this.height,
    this.selected = false,
  });

  final String text;
  final double? width;
  final double? height;
  final String? icon;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: width ?? 176.w,
            height: height ?? 52.h,
            decoration: BoxDecoration(
              color: AppColors.blue4,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [AppColors.boxShadow3],
              border: Border.all(
                width: 4,
                color: AppColors.blue1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Images.coin,
                  width: 20.r,
                  height: 20.r,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 4.w),
                Text(
                  text,
                  style: TextStyleHelpers.textStyle2.copyWith(
                    color: AppColors.yellow1,
                  ),
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
