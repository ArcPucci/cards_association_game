import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.icon,
    required this.size,
  });

  final VoidCallback? onTap;
  final String icon;
  final int size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size.sp,
        height: size.sp,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(icon),
        ),
      ),
    );
  }
}
