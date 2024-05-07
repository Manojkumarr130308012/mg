import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/router.dart';
import 'package:mg/screens/home/home_bloc.dart';
import 'package:mg/screens/home/ui/based_on_amenities_list.dart';
import 'package:mg/screens/home/ui/cities_properties_list.dart';
import 'package:mg/screens/home/ui/filter_amenities_list.dart';
import 'package:mg/screens/home/ui/latest_properties_list.dart';
import 'package:mg/screens/home/ui/popular_properties_list.dart';
import 'package:mg/screens/home/ui/property_type_list.dart';
import 'package:mg/screens/home/ui/range_slider.dart';
import 'package:mg/screens/home/ui/resourse_type_list.dart';
import 'package:mg/screens/home/ui/select_seates_list.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_container.dart';
import 'package:mg/utils/heading.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:mg/utils/sub_heading.dart';
import 'home_event.dart';
import '../../utils/preference_helpher.dart';
import 'package:mg/screens/home/model/PropertiesList.dart';
import 'package:mg/utils/contants.dart';
import 'package:mg/common/shimmers/popular_places.dart';
import 'package:mg/screens/home/model/AmenitiesList.dart';
import 'package:mg/screens/home/model/PropertyTypeList.dart';
import 'package:mg/screens/home/model/MeetingResourceGroup.dart';
import 'package:mg/utils/singleton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc bloc;
  final titles = [
    'All',
    'Dedicated Desk',
    'Flexi/Hot Desk',
    'Chair',
  ];

  int tagSelected = 0;
  Map<int, Widget> map = Map();
  int userId = 0;

  int segmentedControlGroupValue = 0;
  List<Data>? propertiesListes = [];
  List<Datas>? amenitiesListes = [];
  List<PropertyTypeDataDataList>? propertyTypeListes = [];
  List<ResourceResults>? ResourceResultsLists = [];
  final Map<int, Widget> myTabs = <int, Widget>{
    0: Container(
      margin: EdgeInsets.symmetric(horizontal: 33.5.w),
      child: Text("Meeting Spaces",
          style: TextStyle(
              fontSize: 12.sp, fontFamily: FontResousrce.DMSans_MEDIUM)),
    ),
    1: Container(
      margin: EdgeInsets.symmetric(horizontal: 34.w),
      child: Text(
        "Work Spaces",
        style:
            TextStyle(fontSize: 12.sp, fontFamily: FontResousrce.DMSans_MEDIUM),
      ),
    )
  };

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);

    final Map<String, dynamic> data = {"is_meeting_space": 1, "user_id": 1634};
    bloc.add(PropertyListEvent(context: context, arguments: data));
    bloc.add(AmenitiesListEvent(context: context));
    bloc.add(PropertyTypeListEvent(context: context));
    bloc.add(MeetingResourceGroupListEvent(context: context));
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
          listener: (BuildContext context, BaseState state) async {
            if (state is SuccessState) {
              if (state.successResponse is PropertiesList) {
                setState(() {
                  PropertiesList propertiesList = state.successResponse;
                  propertiesListes = propertiesList?.results?.data!;
                });
              } else if (state.successResponse is AmenitiesList) {
                setState(() {
                  AmenitiesList amenitiesList = state.successResponse;
                  amenitiesListes = amenitiesList?.data?.data!;
                });
              } else if (state.successResponse is PropertyTypeList) {
                setState(() {
                  PropertyTypeList propertyTypeList = state.successResponse;
                  propertyTypeListes = propertyTypeList?.data?.data!;
                  print(propertyTypeListes);
                });
              } else if (state.successResponse is MeetingResourceGroup) {
                setState(() {
                  MeetingResourceGroup meetingResourceGroup =
                      state.successResponse;
                  ResourceResultsLists = meetingResourceGroup?.results!;
                  print(ResourceResultsLists);
                });
              }
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
                          backgroundColor: Colors.white,
                          body: Stack(
                            children: [
                              Container(
                                height: 100.h,
                                width: double.infinity,
                                color: ColorResource.primaryColor,
                                child: Container(
                                  height: 64.h,
                                  margin: EdgeInsets.only(top: 20.h),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 300.w,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          child: InkWell(
                                              child: IgnorePointer(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 15.w),
                                                    const Icon(Icons.search),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                      "Search Area, Location etc.,",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              FontResousrce
                                                                  .DMSans_REGULAR,
                                                          fontSize: 12.sp),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    AppRoutes.searchPage);
                                              }),
                                        ),
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          child: IconButton(
                                              onPressed: () {
                                                _showBottomSheet(context);
                                              },
                                              icon: Image.asset(
                                                ImageResource.filter_icon,
                                                scale: 2.0.h,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 60.h,
                                width: double.infinity,
                                color: ColorResource.menuBackgroundColor,
                                margin: EdgeInsets.only(top: 100.h),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: SizedBox(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: titles.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                decoration: BoxDecoration(
                                                    color: tagSelected == index
                                                        ? ColorResource
                                                            .primaryColor
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Center(
                                                      child: index != 0
                                                          ? TextButton.icon(
                                                              onPressed: () {
                                                                setState(() {
                                                                  tagSelected =
                                                                      index;
                                                                });
                                                              },
                                                              style: TextButton
                                                                  .styleFrom(
                                                                splashFactory:
                                                                    NoSplash
                                                                        .splashFactory,
                                                              ),
                                                              icon: Icon(
                                                                color: tagSelected ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                Icons.monitor,
                                                              ),
                                                              label: Text(
                                                                  style: TextStyle(
                                                                      color: tagSelected ==
                                                                              index
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontFamily:
                                                                          FontResousrce
                                                                              .DMSans_REGULAR,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                  titles[
                                                                      index]),
                                                            )
                                                          : TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  tagSelected =
                                                                      index;
                                                                });
                                                              },
                                                              style: TextButton
                                                                  .styleFrom(
                                                                splashFactory:
                                                                    NoSplash
                                                                        .splashFactory,
                                                              ),
                                                              child: Text(
                                                                "All",
                                                                style: TextStyle(
                                                                    color: tagSelected ==
                                                                            index
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontFamily:
                                                                        FontResousrce
                                                                            .DMSans_REGULAR,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                            ),
                                                    )));
                                          }),
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 160.h),
                                child: Center(
                                  child: CustomContainer(
                                    containercontent: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Heading(
                                              text: "Popular Properties",
                                              onTab: () {},
                                            ),
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
                                                      fontSize: 14.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_SEMIBOLD),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        SubHeading(
                                          text:
                                              "Properties situated in the heart of the city",
                                          onTab: () {},
                                        ),
                                        propertiesListes == null
                                            ? PopularPropertiesShimmer() // Widget to display when propertiesListes is null
                                            : PopularProperties(
                                                propertiesList:
                                                    propertiesListes!),
                                        Container(
                                          height: 5.h,
                                          width: double.infinity,
                                          color: ColorResource.offWhite,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Heading(
                                              text: "Cities you might like",
                                              onTab: () {
                                                Navigator.pushNamed(context,
                                                    AppRoutes.explorePage);
                                              },
                                            ),
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
                                                      fontSize: 14.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_SEMIBOLD),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const CitiesProperties(),
                                        Container(
                                          height: 5.h,
                                          width: double.infinity,
                                          color: ColorResource.offWhite,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Heading(
                                              text: "Latest Properties",
                                              onTab: () {},
                                            ),
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
                                                      fontSize: 14.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_SEMIBOLD),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        propertiesListes == null
                                            ? PopularPropertiesShimmer() // Widget to display when propertiesListes is null
                                            : LatestProperties(
                                                propertiesList:
                                                    propertiesListes!),
                                        Container(
                                          height: 5.h,
                                          width: double.infinity,
                                          color: ColorResource.offWhite,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Heading(
                                              text: "Based on amenities",
                                              onTab: () {},
                                            ),
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
                                                      fontSize: 14.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_SEMIBOLD),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        amenitiesListes == null
                                            ? PopularPropertiesShimmer() // Widget to display when propertiesListes is null
                                            : BasedOnAmenitiesProperties(
                                                amenitiesListes:
                                                    amenitiesListes!),
                                        Container(
                                          height: 10.h,
                                          width: double.infinity,
                                          color: ColorResource.white,
                                        ),
                                        Center(
                                          child: SizedBox(
                                            width: 291.w,
                                            height: 90.h,
                                            child: Image.asset(
                                                ImageResource.splashlogo),
                                          ),
                                        ),
                                        Container(
                                          height: 50.h,
                                          width: double.infinity,
                                          color: ColorResource.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15.h,
                                right: 15.w,
                                left: 15.w,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(2, 2),
                                            blurRadius: 5,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          )
                                        ]),
                                    child: SizedBox(
                                      width: 363.w,
                                      height: 40.h,
                                      child: CupertinoSlidingSegmentedControl(
                                        backgroundColor: Colors.white,
                                        thumbColor: ColorResource.primaryColor,
                                        groupValue: segmentedControlGroupValue,
                                        children: myTabs,
                                        onValueChanged: (value) {
                                          setState(() {
                                            segmentedControlGroupValue = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 810.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(25.r), right: Radius.circular(25.r)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 25.h,
                    ),
                  )),
              SizedBox(
                width: 120.w,
              ),
              Center(
                  child: Text(
                "Filter",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ))
            ]),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              thickness: 0.5.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Heading(
                      text: "Price Range",
                      onTab: () {},
                    ),
                    const RangeSliderProperties(),
                    Heading(
                      text: "No of Seats",
                      onTab: () {},
                    ),
                    const SelectSeats(),
                    Heading(
                      text: "Property Type",
                      onTab: () {},
                    ),
                    propertyTypeListes == null
                        ? PopularPropertiesShimmer() // Widget to display when propertiesListes is null
                        : PropertiesTypeList(
                            PropertiesTypeLists: propertyTypeListes!),
                    Heading(
                      text: "Resource Type",
                      onTab: () {},
                    ),
                    ResourceResultsLists == null
                        ? PopularPropertiesShimmer()
                        : ResourceTypeList(
                            ResourceResultsLists: ResourceResultsLists!),
                    Heading(
                      text: "Amenities",
                      onTab: () {},
                    ),
                    amenitiesListes == null
                        ? PopularPropertiesShimmer()
                        : AmenitiesLists(amenitiesListes: amenitiesListes!),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 180.w,
                      height: 40.h,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Clear All",
                            style: TextStyle(
                                color: ColorResource.primaryColor,
                                fontSize: 12.sp,
                                fontFamily: FontResousrce.DMSans_MEDIUM),
                          )),
                    ),
                    Container(
                      width: 180.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: ColorResource.primaryColor,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: TextButton(
                          onPressed: () {
                            print(FlashSingleton.instance.resourceGroupIdArray);
                            print(FlashSingleton.instance.amenityIdArray);
                            print(FlashSingleton.instance.propertyIdArray);
                            Navigator.pushNamed(context, AppRoutes.explorePage);
                          },
                          child: Text(
                            "Apply",
                            style: TextStyle(
                                color: ColorResource.white,
                                fontSize: 12.sp,
                                fontFamily: FontResousrce.DMSans_MEDIUM),
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
  }
}
