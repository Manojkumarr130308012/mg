import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:mg/utils/singleton.dart';

class AmenitiesListWidgets extends StatefulWidget {
  final String id;
  final String title;
  final String icon;
  late bool isSelected;

  AmenitiesListWidgets(
      {super.key,
      required this.id,
      required this.title,
      required this.isSelected,
      required this.icon});
  @override
  State<AmenitiesListWidgets> createState() => _AmenitiesListWidgetsState();
}

class _AmenitiesListWidgetsState extends State<AmenitiesListWidgets> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
        FlashSingleton.instance.addAmenityId(int.parse(widget.id!));
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
                      child: FadeInImage.memoryNetwork(
                        fit: BoxFit.fill,
                        placeholder: kTransparentImage,
                        image: widget.icon,
                        imageScale: 12.0.sp,
                        color: widget.isSelected
                            ? ColorResource.white
                            : ColorResource.lightdark,
                        imageErrorBuilder: (context, error, stacktrace) {
                          // Handle Error for the 2nd time
                          return FadeInImage.memoryNetwork(
                            fit: BoxFit.fill,
                            placeholder: kTransparentImage,
                            image: widget.icon,
                            imageScale: 12.0.sp,
                            color: widget.isSelected
                                ? ColorResource.white
                                : ColorResource.lightdark,
                            imageErrorBuilder: (context, error, stacktrace) {
                              // Handle Error for the 3rd time to return text
                              return Center(child: Text('Image Not Available'));
                            },
                          );
                        },
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
