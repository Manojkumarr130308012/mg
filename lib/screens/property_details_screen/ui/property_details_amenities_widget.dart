import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:transparent_image/transparent_image.dart';

class PropertyDetailsAmenitiesWidget extends StatelessWidget {
  const PropertyDetailsAmenitiesWidget(
      {super.key, required this.image, required this.title, this.onTab});

  final String image;
  final String title;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorResource.dark.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(6.r)),
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
                        child: Padding(
                          padding: EdgeInsets.all(10.0.r),
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
                                imageErrorBuilder:
                                    (context, error, stacktrace) {
                                  // Handle Error for the 3rd time to return text
                                  return Center(
                                      child: Text('Image Not Available'));
                                },
                              );
                            },
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: Text(
                    title,
                    maxLines: 2,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: appStyle(10.sp, ColorResource.dark, FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
