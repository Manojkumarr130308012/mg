import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/explore_screen/explore_bloc.dart';
import 'package:mg/screens/explore_screen/ui/properties_list.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:mg/screens/home/model/PropertiesList.dart';
import '../../router.dart';
import '../../utils/custom_reuseable.dart';
import 'package:mg/common/shimmers/popular_places.dart';
import 'explore_event.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ExploreBloc bloc;
  List<Data>? propertiesListes = [];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ExploreBloc>(context);
    final Map<String, dynamic> data = {"is_meeting_space": 1, "user_id": 1634};
    bloc.add(PropertyListEvent(context: context, arguments: data));
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
                              propertiesListes == null
                                  ? PopularPropertiesShimmer() // Widget to display when propertiesListes is null
                                  : Properties(
                                      propertiesList: propertiesListes!)
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));
  }
}
