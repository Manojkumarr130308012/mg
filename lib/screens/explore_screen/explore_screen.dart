import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/explore_screen/explore_bloc.dart';
import 'package:mg/screens/explore_screen/ui/properties_list.dart';
import 'package:mg/screens/home/model/PropertiesList.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:mg/utils/singleton.dart';

import '../../router.dart';
import '../../utils/custom_reuseable.dart';
import 'explore_event.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ExploreBloc bloc;
  List<Data>? propertiesLists = [];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ExploreBloc>(context);

    final Map<String, dynamic> data = {
      "is_meeting_space": 1,
      "user_id": 1634,
      "latitude": FlashSingleton.instance.latitude != 0.0
          ? FlashSingleton.instance.latitude
          : "",
      "longitude": FlashSingleton.instance.longitude != 0.0
          ? FlashSingleton.instance.longitude
          : "",
      "amenity_id": FlashSingleton.instance.amenityIdArray != null
          ? FlashSingleton.instance.amenityIdArray
          : [],
      "resource_group_id": FlashSingleton.instance.resourceGroupIdArray != null
          ? FlashSingleton.instance.resourceGroupIdArray
          : [],
      "property_type_id": FlashSingleton.instance.propertyIdArray != null
          ? FlashSingleton.instance.propertyIdArray
          : []
    };

    print("datasssss${data}");

    bloc.add(PropertyListEvent(context: context, arguments: data));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, BaseState state) async {
            if (state is SuccessState) {
              if (state.successResponse is PropertiesList) {
                setState(() {
                  PropertiesList propertiesList = state.successResponse;
                  int minPrice = FlashSingleton.instance.minPrice!.toInt();
                  int maxPrice = FlashSingleton.instance.maxPrice!.toInt();
                  if (minPrice != 0 && maxPrice != 0) {
                    // Check if propertiesList and its results are not null
                    if (propertiesList.results != null &&
                        propertiesList.results!.data != null) {
                      // Iterate through each Data object
                      for (Data data in propertiesList.results!.data!) {
                        // Check if leastPlanPrice is not null
                        if (data.leastPlanPrice != null) {
                          // Check if price falls within the specified range
                          if (data.leastPlanPrice!.price! >= minPrice &&
                              data.leastPlanPrice!.price! <= maxPrice) {
                            propertiesLists?.add(data);
                          }
                        }
                      }
                    }
                  } else {
                    propertiesLists = propertiesList.results?.data!;
                  }
                  // FlashSingleton.instance.propertyIdArray?.clear();
                  // FlashSingleton.instance.resourceGroupIdArray?.clear();
                  // FlashSingleton.instance.amenityIdArray?.clear();
                  // FlashSingleton.instance.updateLocation(0.0, 0.0);
                });
              }
            } else if (state is FailureState) {
              setState(() {
                propertiesLists = [];
              });
            }
            setState(() {});
          },
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
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.mapScreen);
                              },
                              child: Text(
                                "Map",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontResousrce.DMSans_MEDIUM,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                          backgroundColor: ColorResource.white,
                          body: Stack(
                            children: [
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
                              propertiesLists == null
                                  ? Container(
                                      child: Center(
                                        child: Text("No Data"),
                                      ),
                                    ) // Widget to display when propertiesListes is null
                                  : propertiesLists != null &&
                                          propertiesLists?.length != 0
                                      ? Properties(
                                          propertiesList: propertiesLists!)
                                      : Container(
                                          child: Center(
                                            child: Text("No Data"),
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
