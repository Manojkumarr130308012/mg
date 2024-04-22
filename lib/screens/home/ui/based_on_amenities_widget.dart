import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:mg/utils/contants.dart';
import 'package:mg/utils/color_resources.dart';

class BasedOnAmenitiesWidget extends StatelessWidget {
  const BasedOnAmenitiesWidget(
      {super.key, required this.image, required this.title, this.onTab});

  final String image;
  final String title;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.only(right: 0.w),
        child: Container(
          width: 62.w,
          height: 140.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r), color: Colors.white),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(26), // Image radius
                          child: Image.network(
                            image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: Text(
                          title,
                          maxLines: 2,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: appStyle(
                              9.sp, ColorResource.grey, FontWeight.w400),
                        ),
                      ),
                    ),
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
