import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:mg/utils/contants.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';

class RecentSearchesWidget extends StatelessWidget {
  const RecentSearchesWidget({super.key, required this.address, this.onTab});

  final String address;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.only(right: 1.w),
        child: Container(
          width: 62.w,
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r), color: Colors.white),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      scale: 1.7,
                      ImageResource.location,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Center(
                      child: ReusableText(
                          text: address,
                          style: appStyle(
                              12.sp, ColorResource.dark, FontWeight.w400)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
