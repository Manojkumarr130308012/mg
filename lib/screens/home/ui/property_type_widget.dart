import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';

class PropertyTypeWidgets extends StatefulWidget {
  final String title;
  final int index;
  const PropertyTypeWidgets(
      {super.key, required this.title, required this.index});

  @override
  State<PropertyTypeWidgets> createState() => _PropertyTypeWidgetsState();
}

class _PropertyTypeWidgetsState extends State<PropertyTypeWidgets> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(children: [
            Container(
              height: 76.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: ColorResource.white,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                border: Border.all(
                  color: ColorResource.primaryColor.withOpacity(0.5),
                  width: 1.w,
                ),
              ),
              child: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: appStyle(10.sp, ColorResource.dark, FontWeight.w500),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
