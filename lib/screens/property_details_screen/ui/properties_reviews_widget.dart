import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:transparent_image/transparent_image.dart';

class PropertiesReviewsWidget extends StatelessWidget {
  const PropertiesReviewsWidget(
      {super.key,
      required this.descriptions,
      required this.image,
      required this.name,
      required this.date,
      required this.rate,
      this.onTab});
  final String descriptions;
  final String image;
  final String name;
  final String date;
  final int rate;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 266.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r), color: Colors.white),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                style: TextStyle(
                    fontFamily: FontResousrce.DMSans_MEDIUM, fontSize: 10.sp),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: FadeInImage.memoryNetwork(
                        fit: BoxFit.fill,
                        placeholder: kTransparentImage,
                        image: image,
                        imageErrorBuilder: (context, error, stacktrace) {
                          // Handle Error for the 2nd time
                          return FadeInImage.memoryNetwork(
                            fit: BoxFit.fill,
                            placeholder: kTransparentImage,
                            image: image,
                            imageErrorBuilder: (context, error, stacktrace) {
                              // Handle Error for the 3rd time to return text
                              return const Center(
                                  child: Text('Image Not Available'));
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow
                              .ellipsis, // Specifies how to handle overflow
                          maxLines: 1, // Limits the text to a single line
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: FontResousrce.DMSans_MEDIUM,
                            color: ColorResource.dark,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          date,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow
                              .ellipsis, // Specifies how to handle overflow
                          maxLines: 1, // Limits the text to a single line
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: FontResousrce.DMSans_REGULAR,
                            color: ColorResource.lightGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  RatingBarIndicator(
                    rating: rate.toDouble(),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: ColorResource.primaryColor,
                    ),
                    itemCount: 5,
                    itemSize: 10,
                    direction: Axis.horizontal,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
