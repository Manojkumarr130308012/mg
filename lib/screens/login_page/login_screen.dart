import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/login_page/login_bloc.dart';
import 'package:mg/screens/login_page/model/LoginResponseModel.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:mg/utils/singleton.dart';

import '../../router.dart';
import '../../utils/base_equatable.dart';
import '../../utils/contants.dart';
import '../../utils/preference_helpher.dart';
import 'login_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisible = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  bool checkBoxValue = false;
  BuildContext? showpopcontext;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);
  }

  loginUser(LoginBloc bloc) async {
    showLoader();
    final Map<String, dynamic> data = {
      "email": emailController.text.trim().toString(),
      "password": passwordController.text.trim().toString(),
      "role": ["Member", "Employee"]
    };
    bloc.add(LoginUserEvent(context: context, arguments: data));
  }

  showLoader() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        showpopcontext = context;
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  hideLoader() {
    if (showpopcontext != null) {
      Navigator.of(showpopcontext!).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {
        if (state is SuccessState) {
          if (state.successResponse is LoginResponse) {
            final LoginResponse response = state.successResponse;
            if (response.status == Constants.success) {
              PreferenceHelper.setBearer(response.data?.token);
              FlashSingleton.instance.bearerToken = response.data?.token;
              print('bearr ${FlashSingleton.instance.bearerToken}');
              showToast('Login Successfully');
              PreferenceHelper.setUserName(response.data?.email);
              PreferenceHelper.setId(response.data?.id);
              PreferenceHelper.setLoginStatus(true);
              hideLoader();
              Navigator.pushReplacementNamed(context, AppRoutes.dashboardPage);
            }
          }
        }
        setState(() {});
      },
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, BaseState state) {
            if (state is SuccessState) {}
            return ScreenUtilInit(
                designSize: const Size(393, 852),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return SafeArea(
                    child: Scaffold(
                      backgroundColor: const Color(0xff0FFA53C),
                      resizeToAvoidBottomInset:
                          true, // <-- Set to true to resize when keyboard appears
                      body: Stack(
                        children: [
                          PlatformDispatcher
                                      .instance.views.first.viewInsets.bottom >
                                  0.0
                              ? Container(
                                  child: Image.asset(
                                    ImageResource.banner,
                                  ),
                                )
                              : Container(
                                  height: 426.h,
                                  child: Image.asset(
                                    ImageResource.banner,
                                  ),
                                ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: SingleChildScrollView(
                              child: Form(
                                key: _formkey,
                                autovalidateMode: _autoValidate,
                                child: Column(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15))),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.h),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15.r),
                                                    topRight:
                                                        Radius.circular(15.r)),
                                              ),
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 24.sp,
                                                    fontFamily: FontResousrce
                                                        .DMSans_SEMIBOLD),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.only(
                                                  left: 15.w,
                                                  top: 15.h,
                                                  right: 15.w,
                                                  bottom: 15.h),
                                              child: Text(
                                                "Hello!👋",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontFamily: FontResousrce
                                                        .DMSans_SEMIBOLD),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.w,
                                                  right: 15.w,
                                                  top: 10.h,
                                                  bottom: 10.h),
                                              child: TextFormField(
                                                controller: emailController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Enter username";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      fontSize: 10.sp),
                                                  floatingLabelStyle: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  label: Text(
                                                    'User Name',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            FontResousrce
                                                                .DMSans_REGULAR,
                                                        fontSize: 14.sp),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: ColorResource
                                                          .primaryColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.red,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.red,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: TextFormField(
                                                controller: passwordController,
                                                enableSuggestions: false,
                                                autocorrect: false,
                                                obscureText: !passwordVisible,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Enter Password";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      fontSize: 10.sp),
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        passwordVisible =
                                                            !passwordVisible;
                                                      });
                                                    },
                                                    icon: Image.asset(
                                                      passwordVisible == true
                                                          ? ImageResource
                                                              .eye_open
                                                          : ImageResource
                                                              .eye_slashed,
                                                    ),
                                                  ),
                                                  floatingLabelStyle:
                                                      const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  label: Text(
                                                    'Password',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            FontResousrce
                                                                .DMSans_REGULAR,
                                                        fontSize: 14.sp),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: ColorResource
                                                          .primaryColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.red,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.red,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    new Checkbox(
                                                        value: checkBoxValue,
                                                        activeColor:
                                                            Colors.orange,
                                                        onChanged:
                                                            (bool? newValue) {
                                                          setState(() {
                                                            checkBoxValue =
                                                                newValue!;
                                                          });
                                                        }),
                                                    Text(
                                                      'Remember me',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 20.w),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                          text:
                                                              '  Forgot Password?',
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontFamily:
                                                                  FontResousrce
                                                                      .DMSans_REGULAR,
                                                              color: Color(
                                                                  0xffeb5e3b)),
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap = () {
                                                                  Navigator.pushNamed(
                                                                      context,
                                                                      AppRoutes
                                                                          .forgetPage);
                                                                }),
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Center(
                                                child: ElevatedButton(
                                              onPressed: () {
                                                if (_formkey.currentState!
                                                    .validate()) {
                                                  loginUser(bloc);
                                                } else {
                                                  setState(() => _autoValidate =
                                                      AutovalidateMode.always);
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ColorResource.primaryColor,
                                                fixedSize: Size(310.w, 50.h),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r),
                                                ),
                                              ),
                                              child: const Text(
                                                "Sign In",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Center(
                                              child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  text: 'Dont have an account?',
                                                  style: TextStyle(
                                                    height: 3.h,
                                                    fontSize: 13.sp,
                                                    fontFamily: FontResousrce
                                                        .DMSans_REGULAR,
                                                    color: Colors.black54,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '  SignUp ',
                                                      style: TextStyle(
                                                          height: 3.h,
                                                          fontSize: 13.sp,
                                                          fontFamily:
                                                              FontResousrce
                                                                  .DMSans_REGULAR,
                                                          color: Color(
                                                              0xffeb5e3b)),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  AppRoutes
                                                                      .signUpScreen);
                                                            },
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                '  Continue as Guest?',
                                                style: TextStyle(
                                                    height: 1.2.h,
                                                    fontSize: 13.sp,
                                                    fontFamily: FontResousrce
                                                        .DMSans_REGULAR,
                                                    color: Color(0xffeb5e3b)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            )
                                          ],
                                        ))
                                  ],
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
    );
  }
}
