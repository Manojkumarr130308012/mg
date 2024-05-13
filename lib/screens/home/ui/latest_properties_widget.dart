import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:mg/screens/home/home_bloc.dart';
import 'package:mg/screens/home/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/screens/home/model/FavoriteList.dart';
import 'package:mg/base/base_state.dart';

class LatestPropertiesWidget extends StatefulWidget {
  LatestPropertiesWidget(
      {super.key,
      required this.image,
      required this.logo,
      required this.title,
      required this.rate,
      required this.rating,
      required this.address,
      required this.unit,
      required this.wish,
      required this.resourceId,
      this.onTab});

  final String image;
  final String logo;
  final String title;
  final int rate;
  final int rating;
  final String address;
  final String unit;
  int? wish;
  int? resourceId;
  final void Function()? onTab;

  @override
  State<LatestPropertiesWidget> createState() => _LatestPropertiesWidgetState();
}

class _LatestPropertiesWidgetState extends State<LatestPropertiesWidget> {
  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    return GestureDetector(
      onTap: widget.onTab,
      child: Padding(
        padding: EdgeInsets.only(right: 0.w),
        child: Container(
          width: 267.w,
          height: 230.h,
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
                        child: FadeInImage.memoryNetwork(
                          fit: BoxFit.fill,
                          placeholder: kTransparentImage,
                          image: widget.image,
                          imageErrorBuilder: (context, error, stacktrace) {
                            // Handle Error for the 2nd time
                            return FadeInImage.memoryNetwork(
                              fit: BoxFit.fill,
                              placeholder: kTransparentImage,
                              image: widget.image,
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
                                    text: '${widget.rating.toDouble()}',
                                    style: appStyle(12.sp, ColorResource.white,
                                        FontWeight.w400))
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      right: 10.w,
                      top: 10.h,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.wish = widget.wish == 1 ? 0 : 1;
                          });
                          final Map<String, dynamic> data = {
                            "is_meeting_space": 1,
                            "user_id": 1634,
                            "is_workspace": 0,
                            "resource_id": widget.resourceId,
                            "status": 1
                          };
                          bloc.add(
                              LikeEvent(context: context, arguments: data));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: widget.wish == 1
                              ? Container(
                                  height: 24.h,
                                  width: 24.w,
                                  color: ColorResource.circleGrey,
                                  child: Icon(
                                    Icons.favorite,
                                    color: ColorResource.primaryColor,
                                    size: 16.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                )
                              : Container(
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
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: Text(
                            widget.title,
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
                          width: 80.w,
                          child: Text(
                            "₹ ${widget.rate}/${widget.unit}",
                            textAlign: TextAlign.end,
                            overflow: TextOverflow
                                .ellipsis, // Specifies how to handle overflow
                            maxLines: 1, // Limits the text to a single line
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: ColorResource.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    ReusableText(
                        text: widget.address,
                        style: appStyle(
                            12.sp, ColorResource.lightGrey, FontWeight.w400))
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
