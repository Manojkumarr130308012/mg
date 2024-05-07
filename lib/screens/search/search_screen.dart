import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/search/search_bloc.dart';
import 'package:mg/screens/search/ui/based_on_cities_list.dart';
import 'package:mg/screens/search/ui/recent_searches_list.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_container.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:mg/utils/search_heading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mg/utils/singleton.dart';
import 'package:mg/router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SearchBloc>(context);
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      FlashSingleton.instance
          .updateLocation(position.latitude, position.longitude);
      print(
          'Latitude: ${FlashSingleton.instance.latitude}, Longitude: ${FlashSingleton.instance.longitude}');
      Navigator.pushNamed(context, AppRoutes.explorePage);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _checkPermission() async {
    // Check if location permission is granted
    PermissionStatus permission = await Permission.location.status;
    if (permission == PermissionStatus.granted) {
      // If permission is granted, get the current location
      getCurrentLocation();
    } else {
      // If permission is not granted, request permission
      permission = await Permission.location.request();
      if (permission == PermissionStatus.granted) {
        // If permission is granted after request, get the current location
        getCurrentLocation();
      } else {
        // If permission is still not granted, show an error message
        print('Location permission not granted');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();
          return false;
        },
        child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, BaseState state) async {},
          child: BlocBuilder(
              bloc: bloc,
              builder: (BuildContext context, BaseState state) {
                if (state is InitialState) {
                  return const Center(
                    child: Text(''),
                  );
                } else if (state is SuccessState) {}
                return ScreenUtilInit(
                    designSize: const Size(393, 852),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (_, child) {
                      return SafeArea(
                        child: Scaffold(
                          backgroundColor: ColorResource.white,
                          body: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.arrow_back)),
                                  ),
                                  Container(
                                    height: 50.h,
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    child: ReusableText(
                                      text: "Search",
                                      style: appStyle(
                                          14.sp, Colors.black, FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 50.h),
                                padding: EdgeInsets.all(10),
                                child: CustomContainer(
                                  containercontent: Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10.w, right: 10.w),
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: ColorResource.whiteGrey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.search,
                                                color: Colors.grey,
                                              ),
                                              hintText:
                                                  "Search Area, Location etc.,",
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: FontResousrce
                                                      .DMSans_REGULAR,
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              suffixIcon: Icon(
                                                size: 20.h,
                                                Icons.close_sharp,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 20.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              scale: 1.5,
                                              ImageResource.current_location,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              width: 7.5.w,
                                            ),
                                            Center(
                                                child: GestureDetector(
                                              onTap: () {
                                                _checkPermission();
                                              },
                                              child: Text(
                                                "Use current location",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: ColorResource.dark,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ))
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: ColorResource.whiteGrey,
                                        height: 1.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.h),
                                        child: SearchHeading(
                                          text: "Recent Searches",
                                          onTab: () {},
                                        ),
                                      ),
                                      RecentSearches(),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      SearchHeading(
                                        text: "Popular Cities",
                                        onTab: () {},
                                      ),
                                      AllCitiesProperties()
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
