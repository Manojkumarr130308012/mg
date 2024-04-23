import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({super.key, required this.text, this.onTab});

  final String text;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableText(
            text: text,
            style: appStyle(12.sp, ColorResource.lightGrey, FontWeight.w500),
          )
        ],
      ),
    );
  }
}
