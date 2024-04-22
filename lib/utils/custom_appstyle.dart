import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double fontSize, Color color, FontWeight fontWeight) {
  return GoogleFonts.poppins(
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
  );
}
