import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/screens/login_page/model/LoginResponseModel.dart';
import 'package:mg/utils/singleton.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/home/home_bloc.dart';
import '../../router.dart';
import '../../utils/base_equatable.dart';
import '../../utils/contants.dart';
import '../../utils/preference_helpher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:flutter/gestures.dart';
import 'package:mg/utils/heading.dart';
import 'package:mg/utils/sub_heading.dart';
import 'package:mg/utils/custom_container.dart';
import 'package:mg/screens/home/ui/popular_properties_list.dart';
import 'package:mg/screens/home/ui/cities_properties_list.dart';
import 'package:mg/screens/home/ui/latest_properties_list.dart';
import 'package:mg/screens/home/ui/based_on_amenities_list.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:flutter/cupertino.dart';

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
  int _currentSelection = 0;

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
                                              height: 45.h,
                                              width: 300.w,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
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
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: FontResousrce
                                                          .DMSans_REGULAR,
                                                      fontSize: 12.sp),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50.h,
                                              width: 50.h,
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
                                            PopularProperties(),
                                            Container(
                                              height: 5.h,
                                              width: double.infinity,
                                              color: ColorResource.offWhite,
                                            ),
                                            Heading(
                                              text: "Cities you might like",
                                              onTab: () {},
                                            ),
                                            CitiesProperties(),
                                            Container(
                                              height: 5.h,
                                              width: double.infinity,
                                              color: ColorResource.offWhite,
                                            ),
                                            Heading(
                                              text: "Latest Properties",
                                              onTab: () {},
                                            ),
                                            LatestProperties(),
                                            Container(
                                              height: 5.h,
                                              width: double.infinity,
                                              color: ColorResource.offWhite,
                                            ),
                                            Heading(
                                              text: "Based on amenities",
                                              onTab: () {},
                                            ),
                                            BasedOnAmenitiesProperties(),
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
                                      bottom: 1.h,
                                      right: 1.w,
                                      left: 1.w,
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0, // Set border width
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0), // Set border radius
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child:
                                                    CupertinoSegmentedControl<
                                                        int>(
                                                  children: {
                                                    0: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 12.h,
                                                              horizontal: 16.w),
                                                      child: Text(
                                                          "    Meeting Spaces   "),
                                                    ),
                                                    1: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 12.h,
                                                              horizontal: 16.w),
                                                      child: Text(
                                                          "     Work Spaces   "),
                                                    ),
                                                  },
                                                  borderColor:
                                                      ColorResource.white,
                                                  groupValue: _currentSelection,
                                                  onValueChanged: (value) {
                                                    setState(() {
                                                      _currentSelection =
                                                          value!;
                                                    });
                                                  },
                                                  selectedColor: ColorResource
                                                      .primaryColor,
                                                )),
                                          ),
                                          SizedBox(height: 10.h)
                                        ],
                                      )))
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
