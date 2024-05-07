import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';

import 'custom_reuseable.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ReusableText(
              text: text,
              style: appStyle(14.sp, ColorResource.dark, FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
