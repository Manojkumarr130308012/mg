import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/intro_page/intro_page_bloc.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';

import '../../router.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late IntroPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<IntroPageBloc>(context);
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
                          body: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                height: 366.h,
                                width: double.infinity,
                                child: Image.asset(
                                  ImageResource.banner,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.only(top: 346.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.r),
                                      topRight: Radius.circular(15.r)),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          width: 260.w,
                                          height: 44.h,
                                          child: Image.asset(
                                            ImageResource.splashlogo,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Center(
                                          child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, AppRoutes.signUpScreen);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(360.w, 50.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          backgroundColor: Colors.orange,
                                        ),
                                        child: Text(
                                          "Create New Account",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  FontResousrce.DMSans_MEDIUM,
                                              fontSize: 14.sp),
                                        ),
                                      )),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      Center(
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text: 'Already have an account?',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily:
                                                  FontResousrce.DMSans_REGULAR,
                                              color: Colors.black54,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '  Login ',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: FontResousrce
                                                        .DMSans_MEDIUM,
                                                    color: ColorResource
                                                        .primaryColor),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            AppRoutes
                                                                .loginScreen);
                                                      },
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(children: <Widget>[
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                              child: Divider(
                                                color: Colors.grey,
                                              )),
                                        ),
                                        Text(
                                          "Or",
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontFamily:
                                                  FontResousrce.DMSans_SEMIBOLD,
                                              color: Colors.black),
                                        ),
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                              child: Divider(
                                                color: Colors.grey,
                                                height: 36,
                                              )),
                                        ),
                                      ]),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Center(
                                        child: OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            fixedSize: Size(360.w, 50.h),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.r),
                                            ),
                                            side: const BorderSide(
                                              color: ColorResource.primaryColor,
                                            ),
                                          ),
                                          child: Text(
                                            'Continue as Guest',
                                            style: TextStyle(
                                                color:
                                                    ColorResource.primaryColor,
                                                fontSize: 14.sp,
                                                fontFamily: FontResousrce
                                                    .DMSans_MEDIUM),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Center(
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text:
                                                ' By continuing you agree to the ',
                                            style: TextStyle(
                                              height: 1.2,
                                              fontSize: 13.sp,
                                              fontFamily:
                                                  FontResousrce.DMSans_REGULAR,
                                              color: Colors.black54,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '  Terms & Condition',
                                                  style: TextStyle(
                                                      height: 1.2,
                                                      fontSize: 13.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_REGULAR,
                                                      color: ColorResource
                                                          .primaryColor)),
                                              TextSpan(
                                                  text: '  and',
                                                  style: TextStyle(
                                                      height: 1.2,
                                                      fontSize: 13.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_REGULAR,
                                                      color: Colors.black54)),
                                              TextSpan(
                                                  text:
                                                      '  Knowledge that you have read out',
                                                  style: TextStyle(
                                                      height: 2,
                                                      fontSize: 13.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_REGULAR,
                                                      color: Colors.black54)),
                                              TextSpan(
                                                  text: '  Privacy Policies',
                                                  style: TextStyle(
                                                      height: 2,
                                                      fontSize: 13.sp,
                                                      fontFamily: FontResousrce
                                                          .DMSans_REGULAR,
                                                      color: ColorResource
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                    ],
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
}
