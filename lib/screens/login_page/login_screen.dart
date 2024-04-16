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
                      resizeToAvoidBottomInset:
                          true, // <-- Set to true to resize when keyboard appears
                      body: Stack(
                        children: [
                          Container(
                            height: 316.h,
                            width: double.infinity,
                            child: Image.asset(
                              ImageResource.banner,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 296.h),
                            child: SingleChildScrollView(
                              child: Form(
                                key: _formkey,
                                autovalidateMode: _autoValidate,
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15))),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 30.h),
                                        Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.sp,
                                              fontFamily: FontResousrce
                                                  .DMSans_SEMIBOLD),
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
                                              bottom: 7.5.h),
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
                                              errorStyle:
                                                  TextStyle(fontSize: 10.sp),
                                              floatingLabelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              label: Text(
                                                'User Name',
                                                style: TextStyle(
                                                    fontFamily: FontResousrce
                                                        .DMSans_REGULAR,
                                                    fontSize: 14.sp),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: ColorResource
                                                      .primaryColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.w,
                                              right: 15.w,
                                              top: 7.5.h,
                                              bottom: 20.h),
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
                                              errorStyle:
                                                  TextStyle(fontSize: 10.sp),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    passwordVisible =
                                                        !passwordVisible;
                                                  });
                                                },
                                                icon: Image.asset(
                                                  passwordVisible == true
                                                      ? ImageResource.eye_open
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
                                                    fontFamily: FontResousrce
                                                        .DMSans_REGULAR,
                                                    fontSize: 14.sp),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: ColorResource
                                                      .primaryColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                    value: checkBoxValue,
                                                    activeColor: Colors.orange,
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
                                                      color: Colors.black,
                                                      fontFamily: FontResousrce
                                                          .DMSans_MEDIUM,
                                                      fontSize: 14.sp),
                                                )
                                              ],
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    right: 20.w),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                      text: 'Forgot Password?',
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontFamily:
                                                              FontResousrce
                                                                  .DMSans_MEDIUM,
                                                          color: ColorResource
                                                              .primaryColor),
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
                                          height: 20.h,
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
                                            fixedSize: Size(360.w, 50.h),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                            ),
                                          ),
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontFamily: FontResousrce
                                                    .DMSans_MEDIUM),
                                          ),
                                        )),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Container(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              text: "Don't have an account?",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: FontResousrce
                                                    .DMSans_REGULAR,
                                                color: Colors.black,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '  SignUp ',
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
                                                                  .signUpScreen);
                                                        },
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Center(
                                          child: Text(
                                            '  Continue as Guest?',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily:
                                                    FontResousrce.DMSans_MEDIUM,
                                                color:
                                                    ColorResource.primaryColor),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        )
                                      ],
                                    )),
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
