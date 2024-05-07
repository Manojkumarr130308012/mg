import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';

class MapPopularPropertiesWidget extends StatelessWidget {
  const MapPopularPropertiesWidget(
      {super.key,
      required this.image,
      required this.logo,
      required this.title,
      required this.rate,
      required this.rating,
      required this.address,
      this.onTab});

  final String image;
  final String logo;
  final String title;
  final int rate;
  final int rating;
  final String address;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 333.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: Colors.white),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SizedBox(
                    height: 111.h,
                    width: 116.w,
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
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
                            const Icon(
                              Icons.star,
                              color: ColorResource.primaryColor,
                              size: 12,
                            ),
                            ReusableText(
                                text: '${rating.toDouble()}',
                                style: appStyle(12.sp, ColorResource.white,
                                    FontWeight.w400))
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Stack(
              children: [
                Positioned(
                    right: 10.w,
                    top: 10.h,
                    child: Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                          color: ColorResource.circleGrey,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: const Icon(
                        Icons.favorite_border,
                        color: ColorResource.offWhite,
                        size: 14.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 215.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          "₹ $rate/hour",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow
                              .ellipsis, // Specifies how to handle overflow
                          maxLines: 1, // Limits the text to a single line
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: ColorResource.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Text(
                          title,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow
                              .ellipsis, // Specifies how to handle overflow
                          maxLines: 1, // Limits the text to a single line
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorResource.dark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          address,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow
                              .ellipsis, // Specifies how to handle overflow
                          maxLines: 1, // Limits the text to a single line
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorResource.lightGrey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
