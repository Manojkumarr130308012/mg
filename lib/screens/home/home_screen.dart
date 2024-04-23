import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/home/home_bloc.dart';
import 'package:mg/screens/home/ui/based_on_amenities_list.dart';
import 'package:mg/screens/home/ui/cities_properties_list.dart';
import 'package:mg/screens/home/ui/latest_properties_list.dart';
import 'package:mg/screens/home/ui/popular_properties_list.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_container.dart';
import 'package:mg/utils/heading.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:mg/utils/sub_heading.dart';
import 'package:mg/router.dart';

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
  Map<int, Widget> map = new Map();

  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = <int, Widget>{
    0: Text(
      "Meeting Spaces",
      style:
          TextStyle(fontFamily: FontResousrce.DMSans_MEDIUM, fontSize: 12.sp),
    ),
    1: Text(
      "Work Spaces",
      style:
          TextStyle(fontFamily: FontResousrce.DMSans_MEDIUM, fontSize: 12.sp),
    )
  };

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
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
                          backgroundColor: Colors.white,
                          body: Stack(
                            children: [
                              Stack(
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
                                                      child: TextField(
                                                    decoration: InputDecoration(
                                                      prefixIcon: const Icon(
                                                        Icons.search,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText:
                                                          "Search Area, Location etc.,",
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily:
                                                              FontResousrce
                                                                  .DMSans_REGULAR,
                                                          fontSize: 12.sp),
                                                    ),
                                                  )),
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
                                                onPressed: () {},
                                                icon: const Icon(Icons.menu),
                                              ),
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
                                    child: Container(
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: SizedBox(
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: titles.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5),
                                                      decoration: BoxDecoration(
                                                          color: tagSelected ==
                                                                  index
                                                              ? ColorResource
                                                                  .primaryColor
                                                              : Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Center(
                                                            child: index != 0
                                                                ? TextButton
                                                                    .icon(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        tagSelected =
                                                                            index;
                                                                      });
                                                                    },
                                                                    icon: Icon(
                                                                      color: tagSelected ==
                                                                              index
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                      Icons
                                                                          .monitor,
                                                                    ),
                                                                    label: Text(
                                                                        style: TextStyle(
                                                                            color: tagSelected == index
                                                                                ? Colors.white
                                                                                : Colors.black,
                                                                            fontSize: 12.sp,
                                                                            fontFamily: FontResousrce.DMSans_REGULAR,
                                                                            fontWeight: FontWeight.normal),
                                                                        titles[index]),
                                                                  )
                                                                : TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        tagSelected =
                                                                            index;
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                      "All",
                                                                      style: TextStyle(
                                                                          color: tagSelected == index
                                                                              ? Colors
                                                                                  .white
                                                                              : Colors
                                                                                  .black,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontFamily: FontResousrce
                                                                              .DMSans_REGULAR,
                                                                          fontWeight:
                                                                              FontWeight.normal),
                                                                    ),
                                                                  ),
                                                          )));
                                                }),
                                          )),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 160.h),
                                    child: Center(
                                      child: CustomContainer(
                                        containercontent: Column(
                                          children: [
                                            Heading(
                                              text: "Popular Properties",
                                              onTab: () {},
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            SubHeading(
                                              text:
                                                  "Properties situated in the heart of the city",
                                              onTab: () {},
                                            ),
                                            const PopularProperties(),
                                            Container(
                                              height: 5.h,
                                              width: double.infinity,
                                              color: ColorResource.offWhite,
                                            ),
                                            Heading(
                                              text: "Cities you might like",
                                              onTab: () {},
                                            ),
                                            const CitiesProperties(),
                                            Container(
                                              height: 5.h,
                                              width: double.infinity,
                                              color: ColorResource.offWhite,
                                            ),
                                            Heading(
                                              text: "Latest Properties",
                                              onTab: () {},
                                            ),
                                            const LatestProperties(),
                                            Container(
                                              height: 5.h,
                                              width: double.infinity,
                                              color: ColorResource.offWhite,
                                            ),
                                            Heading(
                                              text: "Based on amenities",
                                              onTab: () {},
                                            ),
                                            const BasedOnAmenitiesProperties(),
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
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: const Offset(2, 2),
                                                    blurRadius: 5,
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  )
                                                ]),
                                            child: SizedBox(
                                              height: 40.h,
                                              width: 363.w,
                                              child:
                                                  CupertinoSlidingSegmentedControl(
                                                backgroundColor: Colors.white,
                                                thumbColor:
                                                    ColorResource.primaryColor,
                                                groupValue:
                                                    segmentedControlGroupValue,
                                                children: myTabs,
                                                onValueChanged: (value) {
                                                  setState(() {
                                                    segmentedControlGroupValue =
                                                        value!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));
  }
}
