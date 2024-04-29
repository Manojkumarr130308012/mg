import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/common/uidata.dart';

class PropertyTypeWidgets extends StatefulWidget {
  final String title;
  late bool isSelected;
  PropertyTypeWidgets(
      {super.key, required this.title, required this.isSelected});

  @override
  State<PropertyTypeWidgets> createState() => _PropertyTypeWidgetsState();
}

class _PropertyTypeWidgetsState extends State<PropertyTypeWidgets> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(children: [
            Container(
              height: 76.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? ColorResource.primaryColor
                    : ColorResource.white,
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
                  style: appStyle(
                      10.sp,
                      widget.isSelected ? Colors.white : ColorResource.dark,
                      FontWeight.w500),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
