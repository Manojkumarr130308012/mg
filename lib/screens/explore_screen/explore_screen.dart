import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/screens/login_page/model/LoginResponseModel.dart';
import 'package:mg/utils/singleton.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/explore_screen/explore_bloc.dart';
import '../../router.dart';
import '../../utils/base_equatable.dart';
import '../../utils/contants.dart';
import '../../utils/preference_helpher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:flutter/gestures.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/custom_appstyle.dart';
import 'package:mg/utils/custom_container.dart';
import 'package:mg/utils/custom_reuseable.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:mg/utils/search_heading.dart';
import 'package:mg/screens/explore_screen/ui/properties_list.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ExploreBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ExploreBloc>(context);
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
                          backgroundColor: Colors.white,
                          title: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 50.w),
                            child: ReusableText(
                              text: "Explore",
                              style: appStyle(
                                  14.sp, Colors.black, FontWeight.w500),
                            ),
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
                                  ],
                                ),
                              ),
                            ),
                            Properties()
                          ],
                        ),
                      );
                    });
              }),
        ));
  }
}
