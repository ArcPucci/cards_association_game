import 'package:association_card_game/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderedText extends StatelessWidget {
  const BorderedText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'TitanOne',
            fontSize: 40.sp,
            fontWeight: FontWeight.w400,
            height: 48 / 40,
            letterSpacing: -0.16,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 7.r
              ..color = AppColors.yellow3,
          ),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return AppColors.gradient4.createShader(bounds);
          },
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'TitanOne',
              fontSize: 40.sp,
              fontWeight: FontWeight.w400,
              height: 1.16,
              letterSpacing: -0.16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
