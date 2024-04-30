import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:mg/utils/contants.dart';
import 'package:mg/utils/color_resources.dart';

class LatestPropertiesWidget extends StatelessWidget {
  const LatestPropertiesWidget(
      {super.key,
      required this.image,
      required this.logo,
      required this.title,
      required this.rate,
      required this.rating,
      required this.address,
      required this.unit,
      this.onTab});

  final String image;
  final String logo;
  final String title;
  final int rate;
  final int rating;
  final String address;
  final String unit;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.only(right: 0.w),
        child: Container(
          width: 267.w,
          height: 190.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r), color: Colors.white),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: SizedBox(
                        height: 153.h,
                        width: 267.w,
                        child: Image.network(
                          image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 10.w,
                        top: 10.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Container(
                            height: 21.h,
                            width: 43.w,
                            color: ColorResource.circleGrey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: ColorResource.primaryColor,
                                  size: 12.0,
                                ),
                                ReusableText(
                                    text: '${rating}',
                                    style: appStyle(12, ColorResource.white,
                                        FontWeight.w400))
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        right: 10.w,
                        top: 10.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            color: ColorResource.circleGrey,
                            child: Icon(
                              Icons.favorite_border,
                              color: ColorResource.offWhite,
                              size: 16.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                            text: title,
                            style: appStyle(
                                12, ColorResource.dark, FontWeight.w500)),
                        ReusableText(
                            text: "₹ ${rate}/hour",
                            style: appStyle(
                                9, ColorResource.primaryColor, FontWeight.w400))
                      ],
                    ),
                    ReusableText(
                        text: address,
                        style: appStyle(
                            9, ColorResource.lightGrey, FontWeight.w500))
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
