import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';

class PropertyTypeWidget extends StatelessWidget {
  const PropertyTypeWidget({super.key, required this.title, this.onTab});

  final String title;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(children: [
            Container(
              padding: EdgeInsets.all(9),
              height: 76.h,
              width: 115.w,
              decoration: BoxDecoration(
                color: ColorResource.white,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                border: Border.all(
                  color: ColorResource.primaryColor,
                  width: 1.w,
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  maxLines: 2,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: appStyle(12.sp, ColorResource.dark, FontWeight.w500),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
