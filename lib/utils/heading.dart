import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:mg/utils/image_resource.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.text, this.onTab});

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
            padding: EdgeInsets.only(top: 20.h),
            child: ReusableText(
              text: text,
              style: appStyle(14.sp, ColorResource.dark, FontWeight.w600),
            ),
          ),
          GestureDetector(
            onTap: onTab,
            child: Text(
              'View All',
              style: TextStyle(
                  color: ColorResource.primaryColor,
                  fontSize: 12.sp,
                  fontFamily: FontResousrce.DMSans_SEMIBOLD),
            ),
          )
        ],
      ),
    );
  }
}
