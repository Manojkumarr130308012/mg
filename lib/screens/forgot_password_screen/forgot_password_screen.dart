import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/forgot_password_screen/forgot_password_bloc.dart';
import 'package:mg/screens/forgot_password_screen/forgot_password_event.dart';

import '../../base/base_state.dart';
import '../../router.dart';
import '../../utils/color_resources.dart';
import '../../utils/image_resource.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ForgotPasswordBloc bloc;

  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ForgotPasswordBloc>(context);
  }

  loginUser(ForgotPasswordBloc bloc) async {
    final Map<String, dynamic> data = {
      "email": emailController.text.trim().toString(),
    };
    bloc.add(ForgotPasswordAPIEvent(context: context, arguments: data));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {},
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, BaseState state) {
            if (state is InitialState) {
              return const Center(
                child: Text('Loadingggggg'),
              );
            } else {
              return ScreenUtilInit(
                  designSize: const Size(393, 852),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (_, child) {
                    return SafeArea(
                      child: Scaffold(
                        body: Stack(
                          children: [
                            PlatformDispatcher.instance.views.first.viewInsets
                                        .bottom >
                                    0.0
                                ? Container(
                                    height: 205.h,
                                    width: double.infinity,
                                    child: Image.asset(
                                      ImageResource.banner,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    height: 466.h,
                                    width: double.infinity,
                                    child: Image.asset(
                                      ImageResource.banner,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            Container(
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(
                                  top: PlatformDispatcher.instance.views.first
                                              .viewInsets.bottom >
                                          0.0
                                      ? 190.h
                                      : 446.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.r),
                                    topRight: Radius.circular(15.r)),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          top: 25.h,
                                          right: 15.w,
                                          bottom: 10.h),
                                      child: Text(
                                        "Please enter registered email id to reset password",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontFamily:
                                                FontResousrce.DMSans_SEMIBOLD),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          floatingLabelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            'Email ID *',
                                            style: TextStyle(
                                                fontFamily: FontResousrce
                                                    .DMSans_REGULAR,
                                                fontSize: 14.sp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ColorResource.primaryColor,
                                              width: 2.w,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                              width: 2.w,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          top: 5.h,
                                          right: 15.w,
                                          bottom: 10.h),
                                      child: Container(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Center(
                                            child: Text(
                                              "Send Reset Link",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontFamily: FontResousrce
                                                      .DMSans_MEDIUM),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorResource.primaryColor,
                                            fixedSize: Size(360.w, 50.h),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          top: 10.h,
                                          right: 15.w,
                                          bottom: 10.h),
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context, AppRoutes.loginScreen);
                                          },
                                          child: Text(
                                            "Back to Login",
                                            style: TextStyle(
                                                color:
                                                    ColorResource.primaryColor,
                                                fontFamily:
                                                    FontResousrce.DMSans_MEDIUM,
                                                fontSize: 14.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
