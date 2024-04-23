import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/screens/login_page/model/LoginResponseModel.dart';
import 'package:mg/utils/singleton.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/search/search_bloc.dart';
import '../../router.dart';
import '../../utils/base_equatable.dart';
import '../../utils/contants.dart';
import '../../utils/preference_helpher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:flutter/gestures.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:mg/screens/search/ui/based_on_cities_list.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/search_heading.dart';
import 'package:mg/utils/custom_container.dart';
import 'package:mg/screens/search/ui/based_on_cities_list.dart';
import 'package:mg/screens/search/ui/recent_searches_list.dart';

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
                      return Scaffold(
                        backgroundColor: ColorResource.white,
                        appBar: AppBar(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          title: ReusableText(
                            text: "Search",
                            style: appStyle(13, Colors.black, FontWeight.w600),
                          ),
                        ),
                        body: Stack(
                          children: [
                            Padding(
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
                                            hintText: "Search",
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: FontResousrce
                                                    .DMSans_REGULAR,
                                                fontSize: 12.sp),
                                            suffixIcon: Icon(
                                              Icons.cancel,
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.send,
                                            size: 18.sp,
                                            color: ColorResource.primaryColor,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Center(
                                            child: ReusableText(
                                                text: "Use current location",
                                                style: appStyle(
                                                    12.sp,
                                                    ColorResource.dark,
                                                    FontWeight.w400)),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Divider(
                                      color: ColorResource.whiteGrey,
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SearchHeading(
                                      text: "Recent Searches",
                                      onTab: () {},
                                    ),
                                    SizedBox(
                                      height: 20.h,
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
                      );
                    });
              }),
        ));
  }
}
