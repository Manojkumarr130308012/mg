import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/utils/singleton.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/favorites/favorites_bloc.dart';
import '../../router.dart';
import '../../utils/base_equatable.dart';
import '../../utils/contants.dart';
import '../../utils/preference_helpher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:flutter/gestures.dart';
import 'favorites_event.dart';
import 'package:mg/utils/singleton.dart';
import '../../utils/custom_reuseable.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/screens/favorites/ui/properties_list.dart';
import 'package:mg/screens/favorites/model/FavoriteList.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late FavoritesBloc bloc;
  // List<Results>? propertiesLists = [];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<FavoritesBloc>(context);
    //
    // final Map<String, dynamic> data = {
    //   "is_meeting_space": FlashSingleton.instance.space,
    //   "user_id": FlashSingleton.instance.id,
    // };
    //
    // bloc.add(PropertyListEvent(context: context, arguments: data));
  }

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //     onWillPop: () async {
    //       Navigator.pop(context);
    //       return false;
    //     },
    //     child: BlocListener(
    //       bloc: bloc,
    //       listener: (BuildContext context, BaseState state) async {
    //         if (state is SuccessState) {
    //           if (state.successResponse is Favorites) {
    //             setState(() {
    //               Favorites propertiesList = state.successResponse;
    //               propertiesLists = propertiesList.results;
    //             });
    //           } else if (state.successResponse is Favorites) {
    //             Favorites favourite = state.successResponse;
    //             final Map<String, dynamic> data = {
    //               "is_meeting_space": FlashSingleton.instance.space,
    //               "user_id": FlashSingleton.instance.id
    //             };
    //             bloc.add(PropertyListEvent(context: context, arguments: data));
    //           }
    //         } else if (state is FailureState) {
    //           setState(() {
    //             propertiesLists = [];
    //           });
    //         }
    //         setState(() {});
    //       },
    //       child: BlocBuilder(
    //           bloc: bloc,
    //           builder: (BuildContext context, BaseState state) {
    //             if (state is InitialState) {
    //               return const Center(
    //                 child: Text(''),
    //               );
    //             } else if (state is SuccessState) {}
    //             return ScreenUtilInit(
    //                 designSize: const Size(393, 852),
    //                 minTextAdapt: true,
    //                 splitScreenMode: true,
    //                 builder: (_, child) {
    //                   return SafeArea(
    //                     child: Scaffold(
    //                       floatingActionButtonLocation:
    //                           FloatingActionButtonLocation.centerFloat,
    //                       floatingActionButton: Container(
    //                         width: 88.w,
    //                         height: 40.h,
    //                         decoration: BoxDecoration(
    //                           color: ColorResource.primaryColor,
    //                           borderRadius: BorderRadius.circular(20.r),
    //                         ),
    //                         child: MaterialButton(
    //                           onPressed: () {
    //                             Navigator.pushReplacementNamed(
    //                                 context, AppRoutes.mapScreen);
    //                           },
    //                           child: Text(
    //                             "Map",
    //                             style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontFamily: FontResousrce.DMSans_MEDIUM,
    //                                 fontSize: 12.sp),
    //                           ),
    //                         ),
    //                       ),
    //                       backgroundColor: ColorResource.white,
    //                       body: Stack(
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.symmetric(vertical: 20.h),
    //                             child: Row(
    //                               children: [
    //                                 Padding(
    //                                   padding: EdgeInsets.only(
    //                                       left: 15.w, right: 5.w),
    //                                   child: Container(
    //                                     height: 40.h,
    //                                     width: 40.w,
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.white,
    //                                       borderRadius: BorderRadius.all(
    //                                           Radius.circular(20.r)),
    //                                       border:
    //                                           Border.all(color: Colors.grey),
    //                                     ),
    //                                     child: IconButton(
    //                                         onPressed: () {
    //                                           Navigator.pop(context);
    //                                         },
    //                                         icon: const Icon(Icons.arrow_back)),
    //                                   ),
    //                                 ),
    //                                 Padding(
    //                                   padding:
    //                                       EdgeInsets.symmetric(horizontal: 5.w),
    //                                   child: Container(
    //                                     height: 40.h,
    //                                     alignment: Alignment.center,
    //                                     child: ReusableText(
    //                                       text: "Explore",
    //                                       style: appStyle(14.sp, Colors.black,
    //                                           FontWeight.w500),
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 const Spacer(),
    //                                 Padding(
    //                                   padding:
    //                                       EdgeInsets.symmetric(horizontal: 5.w),
    //                                   child: Container(
    //                                     height: 40.h,
    //                                     width: 40.w,
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.white,
    //                                       borderRadius: BorderRadius.all(
    //                                           Radius.circular(20.r)),
    //                                       border: Border.all(
    //                                           color:
    //                                               ColorResource.primaryColor),
    //                                     ),
    //                                     child: IconButton(
    //                                         onPressed: () {},
    //                                         icon: const Icon(
    //                                           Icons.search,
    //                                           color: ColorResource.primaryColor,
    //                                         )),
    //                                   ),
    //                                 ),
    //                                 Padding(
    //                                   padding:
    //                                       EdgeInsets.symmetric(horizontal: 5.w),
    //                                   child: Container(
    //                                     height: 40.h,
    //                                     width: 40.w,
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.white,
    //                                       borderRadius: BorderRadius.all(
    //                                           Radius.circular(20.r)),
    //                                       border: Border.all(
    //                                           color:
    //                                               ColorResource.primaryColor),
    //                                     ),
    //                                     child: IconButton(
    //                                         onPressed: () {},
    //                                         icon: const Icon(
    //                                           Icons.menu_open,
    //                                           color: ColorResource.primaryColor,
    //                                         )),
    //                                   ),
    //                                 ),
    //                                 Padding(
    //                                   padding: EdgeInsets.only(
    //                                       left: 5.w, right: 15.w),
    //                                   child: Container(
    //                                     height: 40.h,
    //                                     width: 40.w,
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.white,
    //                                       borderRadius: BorderRadius.all(
    //                                           Radius.circular(20.r)),
    //                                       border: Border.all(
    //                                           color:
    //                                               ColorResource.primaryColor),
    //                                     ),
    //                                     child: IconButton(
    //                                         onPressed: () {},
    //                                         icon: const Icon(
    //                                           Icons.settings,
    //                                           color: ColorResource.primaryColor,
    //                                         )),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           propertiesLists == null
    //                               ? Container(
    //                                   child: Center(
    //                                     child: Text("No Data"),
    //                                   ),
    //                                 ) // Widget to display when propertiesListes is null
    //                               : propertiesLists != null &&
    //                                       propertiesLists?.length != 0
    //                                   ? Properties(
    //                                       propertiesList: propertiesLists!)
    //                                   : Container(
    //                                       child: Center(
    //                                         child: Text("No Data"),
    //                                       ),
    //                                     )
    //                         ],
    //                       ),
    //                     ),
    //                   );
    //                 });
    //           }),
    //     ));

    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, BaseState state) async {
            if (state is SuccessState) {
            } else if (state is FailureState) {}
          },
          child: BlocBuilder(
              bloc: bloc,
              builder: (BuildContext context, BaseState state) {
                if (state is InitialState) {
                  return const Center(
                    child: Text(''),
                  );
                } else if (state is SuccessState) {}
                return Center(
                  child: Text('Favorites'),
                );
              }),
        ));
  }
}
