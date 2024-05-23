import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    this.onTap,
    required this.asset,
    this.width,
    this.height,
  });

  final VoidCallback? onTap;
  final String asset;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? 360.w,
        height: height ?? 156.h,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(asset),
        ),
      ),
    );
  }
}
