import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/home/model/PropertiesList.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/contants.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../../router.dart';

class PropertiesWidget extends StatelessWidget {
  final List<Images> image;
  final String logo;
  final String title;
  final int rate;
  final int rating;
  final String address;
  final String unit;
  final List<PropertyAmenities> icon;
  final void Function()? onTab;

  const PropertiesWidget(
      {super.key,
      required this.image,
      required this.logo,
      required this.title,
      required this.rate,
      required this.rating,
      required this.address,
      this.onTab,
      required this.icon,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
            context, AppRoutes.propertyDetailsScreen);
      },
      child: SizedBox(
        height: 350.h,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                        height: 242.h,
                        width: 363.w,
                        child: FlutterCarousel(
                          options: CarouselOptions(
                            height: 242.h,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1.0,
                            showIndicator: true,
                            slideIndicator:
                                CircularSlideIndicator(indicatorRadius: 4.r),
                          ),
                          items: image.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: 393.w,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: FadeInImage.memoryNetwork(
                                      fit: BoxFit.fill,
                                      placeholder: kTransparentImage,
                                      image:
                                          "${Constants.basePath}${i?.imagePath}" ??
                                              "",
                                      imageErrorBuilder:
                                          (context, error, stacktrace) {
                                        // Handle Error for the 2nd time
                                        return FadeInImage.memoryNetwork(
                                          fit: BoxFit.fill,
                                          placeholder: kTransparentImage,
                                          image:
                                              "${Constants.basePath}${i?.imagePath}" ??
                                                  "",
                                          imageErrorBuilder:
                                              (context, error, stacktrace) {
                                            // Handle Error for the 3rd time to return text
                                            return Center(
                                                child: Text(
                                                    'Image Not Available'));
                                          },
                                        );
                                      },
                                    ));
                              },
                            );
                          }).toList(),
                        )),
                  ),
                  Positioned(
                    left: 15.w,
                    top: 15.h,
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
                                text: '$rating',
                                style: appStyle(12.sp, ColorResource.white,
                                    FontWeight.w400))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 15.w,
                      top: 15.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Container(
                          height: 24.h,
                          width: 24.w,
                          color: ColorResource.circleGrey,
                          child: const Icon(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                        text: title,
                        style: appStyle(
                            14.sp, ColorResource.dark, FontWeight.w600)),
                    ReusableText(
                        text: "₹ $rate/${unit}",
                        style: appStyle(
                            15.sp, ColorResource.primaryColor, FontWeight.w600))
                  ],
                ),
                SizedBox(height: 4.h),
                ReusableText(
                    text: address,
                    style: appStyle(
                        12.sp, ColorResource.lightGrey, FontWeight.w400))
              ],
            ),
            SizedBox(
              height: 50.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: icon.length,
                itemBuilder: (BuildContext context, int index) {
                  PropertyAmenities icons = icon[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        left: 0.w, top: 6.h, bottom: 6.h, right: 8.w),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          border: Border.all(
                            color: ColorResource.lightGrey.withOpacity(0.5),
                            width: 1.w,
                          )),
                      child: Padding(
                          padding: EdgeInsets.all(6.0.r),
                          child: Image.network(
                              icons.iconPath != null &&
                                      icons.iconPath!.isNotEmpty
                                  ? "${Constants.basePath}${icons.iconPath}"
                                  : '',
                              fit: BoxFit.fill)),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
