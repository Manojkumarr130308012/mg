import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:mg/screens/map_screen/map_bloc.dart';
import 'package:mg/screens/map_screen/ui/map_popular_properties_list.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';

import '../../base/base_state.dart';
import '../../utils/custom_appstyle.dart';
import '../../utils/custom_reuseable.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapBloc? bloc;

  Container buildTextWidget(String word) {
    return Container(
        alignment: Alignment.center,
        child: Text(
          word,
          textAlign: TextAlign.center,
        ));
  }

  Marker buildMarker(LatLng coordinates, String word) {
    return Marker(
        point: coordinates,
        width: 100,
        height: 12,
        child: buildTextWidget(word));
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
          listener: (BuildContext context, BaseState state) async {},
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
                          floatingActionButtonLocation:
                              FloatingActionButtonLocation.centerFloat,
                          floatingActionButton: Container(
                            width: 88.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: ColorResource.primaryColor,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "List",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontResousrce.DMSans_MEDIUM,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                          body: Stack(
                            children: [
                              FlutterMap(
                                  options: const MapOptions(
                                    initialCenter: LatLng(11.016844, 76.955833),
                                    initialZoom: 12,
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'com.example.app',
                                    ),
                                    MarkerLayer(
                                      markers: <Marker>[
                                        Marker(
                                          width: 80.w,
                                          height: 40.h,
                                          point: const LatLng(
                                              11.016844, 76.955833),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color:
                                                      ColorResource.lightGrey),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "\$1000",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontFamily: FontResousrce
                                                        .DMSans_BOLD),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Marker(
                                          width: 80.w,
                                          height: 40.h,
                                          point: const LatLng(
                                              11.009880, 76.949966),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color:
                                                      ColorResource.lightGrey),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "\$800",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontFamily: FontResousrce
                                                        .DMSans_BOLD),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.arrow_back)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Container(
                                        height: 40.h,
                                        alignment: Alignment.center,
                                        child: ReusableText(
                                          text: "Explore",
                                          style: appStyle(14.sp, Colors.black,
                                              FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Container(
                                        height: 40.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          border: Border.all(
                                              color:
                                                  ColorResource.primaryColor),
                                        ),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.search,
                                              color: ColorResource.primaryColor,
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Container(
                                        height: 40.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          border: Border.all(
                                              color:
                                                  ColorResource.primaryColor),
                                        ),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.menu_open,
                                              color: ColorResource.primaryColor,
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          border: Border.all(
                                              color:
                                                  ColorResource.primaryColor),
                                        ),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.settings,
                                              color: ColorResource.primaryColor,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const MapPopularProperties(),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));
  }
}
