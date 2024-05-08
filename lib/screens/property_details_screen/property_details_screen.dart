import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:mg/screens/property_details_screen/model/propertyDetailsInfo.dart';
import 'package:mg/screens/property_details_screen/property_details_bloc.dart';
import 'package:mg/screens/property_details_screen/ui/properties_reviews_list.dart';
import 'package:mg/screens/property_details_screen/ui/property_details_amenities_list.dart';
import 'package:mg/screens/property_details_screen/ui/reservation_plan_list.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../base/base_state.dart';
import '../../router.dart';
import '../../utils/color_resources.dart';
import '../../utils/contants.dart';
import '../../utils/custom_appstyle.dart';
import '../../utils/custom_reuseable.dart';
import '../home/model/AmenitiesList.dart';
import 'property_details_event.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> args;

  const PropertyDetailsScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  late PropertyDetailsBloc bloc;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<String> listsData = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<Datas>? amenitiesLists = [];
  List<Results>? propertiesInfoLists = [];
  List<PropertyImages>? propertiesImageLists = [];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<PropertyDetailsBloc>(context);
    final Map<String, dynamic> args = widget.args;
    final propertyId = args['property_id'];
    final resourceId = args['resource_id'];
    bloc.add(PropertyInfoEvent(context: context, arguments: args));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true, //When false, blocks the current route from being popped.
        onPopInvoked: (didPop) {
          //do your logic here:
        },
        child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, BaseState state) async {
            if (state is SuccessState) {
              if (state.successResponse is PropertyDetailsInfo) {
                setState(() {
                  PropertyDetailsInfo propertyDetailsInfo =
                      state.successResponse;
                  propertiesInfoLists = propertyDetailsInfo.results;

                  if (propertiesInfoLists != null) {
                    for (Results property in propertiesInfoLists!) {
                      if (property.propertyImages != null) {
                        propertiesImageLists?.addAll(property.propertyImages!);
                      }
                    }
                  }
                });
              }
            } else if (state is FailureState) {
              setState(() {
                propertiesInfoLists = [];
              });
            }
            setState(() {});
          },
          child: BlocBuilder(
              bloc: bloc,
              builder: (BuildContext context, BaseState state) {
                if (state is InitialState) {
                } else if (state is SuccessState) {}
                return ScreenUtilInit(
                    designSize: const Size(393, 852),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (_, child) {
                      return SafeArea(
                        child: Scaffold(
                          backgroundColor: ColorResource.white,
                          body: Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CarouselSlider.builder(
                                            carouselController: _controller,
                                            options: CarouselOptions(
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _current = index;
                                                });
                                              },
                                              autoPlay: true,
                                              viewportFraction: 1,
                                              disableCenter: false,
                                            ),
                                            itemCount: propertiesImageLists
                                                    ?.length ??
                                                0, // Ensure itemCount is not null
                                            itemBuilder: (BuildContext context,
                                                int index, int realIndex) {
                                              if (propertiesImageLists !=
                                                      null &&
                                                  index >= 0 &&
                                                  index <
                                                      propertiesImageLists!
                                                          .length) {
                                                PropertyImages? image =
                                                    propertiesImageLists![
                                                        index];
                                                if (image != null) {
                                                  return Center(
                                                    child: Container(
                                                      width: 393.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: FadeInImage
                                                          .memoryNetwork(
                                                        fit: BoxFit.fill,
                                                        placeholder:
                                                            kTransparentImage,
                                                        image:
                                                            "${Constants.basePath}${image.imagePath}" ??
                                                                "",
                                                        imageErrorBuilder:
                                                            (context, error,
                                                                stacktrace) {
                                                          // Handle Error for the 2nd time
                                                          return FadeInImage
                                                              .memoryNetwork(
                                                            fit: BoxFit.fill,
                                                            placeholder:
                                                                kTransparentImage,
                                                            image:
                                                                "${Constants.basePath}${image}" ??
                                                                    "",
                                                            imageErrorBuilder:
                                                                (context, error,
                                                                    stacktrace) {
                                                              // Handle Error for the 3rd time to return text
                                                              return Center(
                                                                child: Text(
                                                                    'Image Not Available'),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                }
                                              }
                                              // Return a placeholder widget or handle other cases
                                              return Container();
                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20.h),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.w, right: 5.w),
                                                  child: Container(
                                                    height: 40.h,
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.r)),
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.arrow_back)),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.w),
                                                  child: Container(
                                                    height: 40.h,
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.r)),
                                                      border: Border.all(),
                                                    ),
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.share,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 5.w, right: 15.w),
                                                  child: Container(
                                                    height: 40.h,
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.r)),
                                                      border: Border.all(),
                                                    ),
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons
                                                              .favorite_outline,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 10.h),
                                        child: Column(
                                          children: [
                                            Row(children: [
                                              Text(
                                                "7 Seater Meeting Room",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: FontResousrce
                                                        .DMSans_SEMIBOLD,
                                                    fontSize: 16.sp),
                                              ),
                                              const Spacer(),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                                child: Container(
                                                  height: 21.h,
                                                  width: 43.w,
                                                  color:
                                                      ColorResource.circleGrey,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color: ColorResource
                                                            .primaryColor,
                                                        size: 12,
                                                      ),
                                                      ReusableText(
                                                          text: "5",
                                                          style: appStyle(
                                                              12.sp,
                                                              ColorResource
                                                                  .white,
                                                              FontWeight.w400))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]),
                                            Row(children: [
                                              Text(
                                                "Bangalore, Karnataka",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: FontResousrce
                                                        .DMSans_REGULAR,
                                                    fontSize: 12.sp),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "35 Reviews",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.black,
                                                    fontFamily: FontResousrce
                                                        .DMSans_REGULAR,
                                                    fontSize: 12.sp),
                                              )
                                            ]),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 5.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Availability",
                                                  style: TextStyle(
                                                      color: ColorResource.dark,
                                                      fontSize: 14.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_SEMIBOLD),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushNamed(context,
                                                        AppRoutes.explorePage);
                                                  },
                                                  child: Text(
                                                    '09:00 AM - 07:00 PM',
                                                    style: TextStyle(
                                                        color: ColorResource
                                                            .primaryColor,
                                                        fontSize: 12.sp,
                                                        fontFamily: FontResousrce
                                                            .DMSans_SEMIBOLD),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            SizedBox(
                                              height: 50.h,
                                              child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: listsData.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Container(
                                                    height: 40.h,
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.r),
                                                        border: Border.all(
                                                          color: ColorResource
                                                              .primaryColor,
                                                        )),
                                                    child: Center(
                                                      child: Text(
                                                        listsData[index],
                                                        style: TextStyle(
                                                            color: ColorResource
                                                                .primaryColor,
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                                FontResousrce
                                                                    .DMSans_MEDIUM),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                  width: 13.w,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 5.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Amenities",
                                                  style: TextStyle(
                                                      color: ColorResource.dark,
                                                      fontSize: 14.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_SEMIBOLD),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushNamed(context,
                                                        AppRoutes.explorePage);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10.h, right: 5.w),
                                                    child: Text(
                                                      'View All',
                                                      style: TextStyle(
                                                          color: ColorResource
                                                              .primaryColor,
                                                          fontSize: 12.sp,
                                                          fontFamily: FontResousrce
                                                              .DMSans_SEMIBOLD),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            const PropertyDetailsAmenities()
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 5.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Reservation Plans",
                                              style: TextStyle(
                                                  color: ColorResource.dark,
                                                  fontSize: 14.sp,
                                                  fontFamily: FontResousrce
                                                      .DMSans_SEMIBOLD),
                                            ),
                                            SizedBox(height: 12.h),
                                            const ReservationPlan()
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 5.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Property Information",
                                              style: TextStyle(
                                                  color: ColorResource.dark,
                                                  fontSize: 14.sp,
                                                  fontFamily: FontResousrce
                                                      .DMSans_SEMIBOLD),
                                            ),
                                            SizedBox(height: 12.h),
                                            Text(
                                              "BRH classic house is one of our flagship offices located out of Koramangala in Bangalore. A bright, lively & Spacious office that consist of 6 seater conference room. 3 seater meeting room and several dedicated desk. it is situated near BD complex.",
                                              style: TextStyle(
                                                  fontFamily: FontResousrce
                                                      .DMSans_MEDIUM,
                                                  fontSize: 10.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 5.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Location",
                                              style: TextStyle(
                                                  color: ColorResource.dark,
                                                  fontSize: 14.sp,
                                                  fontFamily: FontResousrce
                                                      .DMSans_SEMIBOLD),
                                            ),
                                            SizedBox(height: 12.h),
                                            SizedBox(
                                              height: 190.h,
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10), // Adjust the radius as needed
                                                    child: FlutterMap(
                                                        options:
                                                            const MapOptions(
                                                          initialCenter: LatLng(
                                                              11.016844,
                                                              76.955833),
                                                          initialZoom: 12,
                                                        ),
                                                        children: [
                                                          TileLayer(
                                                            urlTemplate:
                                                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                            userAgentPackageName:
                                                                'com.example.app',
                                                          ),
                                                        ]),
                                                  ),
                                                  const Center(
                                                      child: Icon(
                                                    Icons.location_pin,
                                                    size: 50,
                                                  ))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 5.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Review & Ratings",
                                                  style: TextStyle(
                                                      color: ColorResource.dark,
                                                      fontSize: 14.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_SEMIBOLD),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushNamed(context,
                                                        AppRoutes.explorePage);
                                                  },
                                                  child: Text(
                                                    'View All',
                                                    style: TextStyle(
                                                        color: ColorResource
                                                            .primaryColor,
                                                        fontSize: 12.sp,
                                                        fontFamily: FontResousrce
                                                            .DMSans_SEMIBOLD),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            const PropertiesReviews()
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 5.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Support Team",
                                              style: TextStyle(
                                                  color: ColorResource.dark,
                                                  fontSize: 14.sp,
                                                  fontFamily: FontResousrce
                                                      .DMSans_SEMIBOLD),
                                            ),
                                            SizedBox(height: 12.h),
                                            Text(
                                              "Our highly skilled support managers and concierge team specialises in tailoring their services to your personal requirements. We offer only the best qualified personnel to provide day to day customized assistance, as per your needs.",
                                              style: TextStyle(
                                                  fontFamily: FontResousrce
                                                      .DMSans_MEDIUM,
                                                  fontSize: 10.sp),
                                            ),
                                            SizedBox(height: 9.h),
                                            Text(
                                              "BeRightHere Community and Admin staff are available from Monday to Saturday from 09.00 AM to 06.00 PM",
                                              style: TextStyle(
                                                  fontFamily: FontResousrce
                                                      .DMSans_MEDIUM,
                                                  fontSize: 10.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 60.h,
                                margin: EdgeInsets.only(top: 10.h), // ***
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      spreadRadius: 0.5,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 180.w,
                                        height: 50.h,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "₹ 500",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_SEMIBOLD),
                                                ),
                                                SizedBox(width: 2.w),
                                                Text(
                                                  "₹1500",
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 10.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_REGULAR),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "3 Seater Meeting Room",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: FontResousrce
                                                      .DMSans_REGULAR),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 180.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            color: ColorResource.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Reserve",
                                              style: TextStyle(
                                                  color: ColorResource.white,
                                                  fontSize: 12.sp,
                                                  fontFamily: FontResousrce
                                                      .DMSans_MEDIUM),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));
  }
}
