import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';

class ResourceTypeWidgets extends StatefulWidget {
  final String title;
  final String icon;
  late bool isSelected;

  ResourceTypeWidgets(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.icon});

  @override
  State<ResourceTypeWidgets> createState() => _ResourceTypeWidgetsState();
}

class _ResourceTypeWidgetsState extends State<ResourceTypeWidgets> {
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: ImageIcon(
                        AssetImage(
                            'assets/images/icons/resource_type_icons/${widget.icon}.png'),
                        size: 30.h,
                        color: widget.isSelected
                            ? Colors.white
                            : ColorResource.dark,
                      ),
                    ),
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: appStyle(
                          10.sp,
                          widget.isSelected ? Colors.white : ColorResource.dark,
                          FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}