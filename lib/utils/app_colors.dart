import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const Color blue1 = Color(0xFF8EB5ED);
  static const Color blue2 = Color(0xFF133C72);
  static const Color blue3 = Color(0xFF9DF0FF);
  static const Color blue4 = Color(0xFF393081);
  static const Color blue5 = Color(0xFF174083);
  static const Color blue6 = Color(0xFF2FC4E2);
  static const Color blue7 = Color(0xFF67EBF9);
  static const Color blue8 = Color(0xFF2172E6);
  static const Color yellow1 = Color(0xFFFBDB24);
  static const Color yellow2 = Color(0xFFF07300);
  static const Color yellow3 = Color(0xFFEB8F08);
  static const Color yellow4 = Color(0xFFF9C00A);
  static const Color yellow5 = Color(0xFFF9BD00);
  static const Color purple = Color(0xFF5E51C1);
  static const Color red = Color(0xFFB3350D);

  static final BoxShadow boxShadow1 = BoxShadow(
    color: blue2,
    blurRadius: 1.3.r,
    offset: Offset(0, 1.3.r),
  );

  static final BoxShadow boxShadow2 = BoxShadow(
    // offset: const Offset(0, 4),
    blurRadius: 4.sp,
    color: blue2,
    blurStyle: BlurStyle.outer,
  );

  static final BoxShadow boxShadow3 = BoxShadow(
    offset: const Offset(0, 4),
    blurRadius: 2.sp,
    color: blue2,
  );

  static const BoxShadow boxShadow4 = BoxShadow(
    offset: Offset(0, 4),
    color: purple,
  );

  static const BoxShadow boxShadow5 = BoxShadow(
    offset: Offset(0, 4),
    color: red,
  );

  static const BoxShadow boxShadow6 = BoxShadow(
    offset: Offset(0, 4),
    color: blue8,
  );

  static final LinearGradient gradient1 = LinearGradient(
    colors: [
      const Color(0xFF2272EA).withOpacity(0.25),
      const Color(0xFF2D8BEF).withOpacity(0.25),
    ],
  );

  static const LinearGradient gradient2 = LinearGradient(
    colors: [
      Color(0xFF8A90FE),
      Color(0xFF7169D0),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient gradient3 = LinearGradient(
    colors: [
      Color(0xFFFBDB24),
      Color(0xFFFA5A01),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient gradient4 = LinearGradient(
    colors: [
      yellow4,
      yellow5,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
