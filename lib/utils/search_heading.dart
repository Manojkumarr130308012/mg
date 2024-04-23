import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:mg/utils/contants.dart';
import 'package:mg/utils/color_resources.dart';

class SearchHeading extends StatelessWidget {
  const SearchHeading({super.key, required this.text, this.onTab});

  final String text;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: ReusableText(
              text: text,
              style: appStyle(12, ColorResource.dark, FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
