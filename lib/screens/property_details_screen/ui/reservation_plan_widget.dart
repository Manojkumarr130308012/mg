import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:transparent_image/transparent_image.dart';

class ReservationPlanWidget extends StatelessWidget {
  const ReservationPlanWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.plans,
      required this.price,
      required this.offer,
      required this.isSelected,
      this.onTab});

  final String image;
  final String title;
  final String plans;
  final String price;
  final String offer;
  final bool isSelected;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 217.w,
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorResource.dark.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(8.r)),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: SizedBox(
                  height: 129.h,
                  width: 217.w,
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
              SizedBox(height: 7.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  overflow:
                      TextOverflow.ellipsis, // Specifies how to handle overflow
                  maxLines: 1, // Limits the text to a single line
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorResource.dark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 7.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  plans,
                  textAlign: TextAlign.start,
                  overflow:
                      TextOverflow.ellipsis, // Specifies how to handle overflow
                  maxLines: 1, // Limits the text to a single line
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorResource.lightGrey,
                    fontFamily: FontResousrce.DMSans_REGULAR,
                  ),
                ),
              ),
              SizedBox(height: 7.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "₹$price",
                      overflow: TextOverflow
                          .ellipsis, // Specifies how to handle overflow
                      maxLines: 1, // Limits the text to a single line
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorResource.dark,
                        fontFamily: FontResousrce.DMSans_SEMIBOLD,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "₹ 1500",
                      overflow: TextOverflow
                          .ellipsis, // Specifies how to handle overflow
                      maxLines: 1, // Limits the text to a single line
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10.sp,
                        color: ColorResource.dark,
                        fontFamily: FontResousrce.DMSans_REGULAR,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "$offer % off",
                      overflow: TextOverflow
                          .ellipsis, // Specifies how to handle overflow
                      maxLines: 1, // Limits the text to a single line
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: ColorResource.primaryColor,
                        fontFamily: FontResousrce.DMSans_REGULAR,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 34.h,
                    width: 199.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: isSelected ? Colors.green : Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 45.w),
                            child: Text(
                              isSelected ? "Selected" : "Select",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: isSelected ? Colors.green : Colors.black,
                                fontFamily: FontResousrce.DMSans_REGULAR,
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: Icon(
                            isSelected ? Icons.check : null,
                            size: 24,
                            color: isSelected ? Colors.green : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
