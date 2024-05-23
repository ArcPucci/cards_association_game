import 'package:association_card_game/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode.requestFocus,
      child: Container(
        width: 336.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2.sp,
            color: AppColors.blue5,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration.collapsed(
              hintText: 'Name',
              hintStyle: TextStyleHelpers.textStyle4.copyWith(
                color: AppColors.blue5.withOpacity(0.4),
              ),
            ),
            style: TextStyleHelpers.textStyle4,
          ),
        ),
      ),
    );
  }
}
