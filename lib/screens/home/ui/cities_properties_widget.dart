import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';

class CitiesPropertiesWidget extends StatelessWidget {
  const CitiesPropertiesWidget(
      {super.key, required this.image, required this.title, this.onTab});

  final String image;
  final String title;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.5.w),
        child: Container(
          width: 62.w,
          height: 82.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r), color: Colors.white),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(26.r), // Image radius
                        child: Image.network(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: ReusableText(
                        text: title,
                        style: appStyle(
                            10.sp, ColorResource.dark, FontWeight.w500)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
