import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/signup_screen/signup_bloc.dart';
import 'package:mg/screens/signup_screen/signup_event.dart';
import 'package:mg/screens/signup_success_screen/signup_success_screen.dart';
import 'package:mg/utils/color_resources.dart';

import '../../base/base_state.dart';
import '../../utils/image_resource.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpBloc bloc;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SignUpBloc>(context);
  }

  loginUser(SignUpBloc bloc) async {
    final Map<String, dynamic> data = {
      "firstName": firstNameController.text.trim().toString(),
      "lastName": lastNameController.text.trim().toString(),
      "companyName": companyNameController.text.trim().toString(),
      "email": emailController.text.trim().toString(),
      "mobile": mobileController.text.trim().toString(),
      "password": passwordController.text.trim().toString(),
      "confirmPassword": confirmPasswordController.text.trim().toString(),
    };
    bloc.add(SignUpUserEvent(context: context, arguments: data));
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
                child: Text('New DAT888888888888888888888A'),
              );
            } else {
              return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (_, child) {
                    return SafeArea(
                      child: Scaffold(
                        backgroundColor: Color(0xff0FFA53C),
                        body: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              child: Image.asset(
                                ImageResource.banner,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 100.h),
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
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: 10.h),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily:
                                                FontResousrce.DMSans_SEMIBOLD),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          top: 15.h,
                                          right: 15.w,
                                          bottom: 10.h),
                                      child: Text(
                                        "Hello!👋",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontFamily:
                                                FontResousrce.DMSans_SEMIBOLD),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          floatingLabelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            'First Name *',
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
                                            borderSide: const BorderSide(
                                              color: ColorResource.primaryColor,
                                              width: 2,
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
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          floatingLabelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            'Last Name *',
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
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          floatingLabelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            'Company Name (Optional)',
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
                                      padding: const EdgeInsets.all(15),
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
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
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
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          floatingLabelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            'Mobile Number *',
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
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          floatingLabelStyle: TextStyle(
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
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          floatingLabelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            'Confirm Password',
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
                                          top: 10.h,
                                          right: 15.w,
                                          bottom: 10.h),
                                      child: Container(
                                        height: 50.h,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Center(
                                            child: Text(
                                              "Continue",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontFamily: FontResousrce
                                                      .DMSans_MEDIUM),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorResource.primaryColor),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          top: 10.h,
                                          right: 15.w,
                                          bottom: 10.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Already have an account?",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: FontResousrce
                                                          .DMSans_REGULAR,
                                                      fontSize: 14.sp)),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "Sign In",
                                                  style: TextStyle(
                                                      color: ColorResource
                                                          .primaryColor,
                                                      fontFamily: FontResousrce
                                                          .DMSans_MEDIUM,
                                                      fontSize: 14.sp),
                                                ),
                                              )
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignUpSuccessScreen()),
                                              );
                                            },
                                            child: Text(
                                              "Continue as Guest?",
                                              style: TextStyle(
                                                  color: ColorResource
                                                      .primaryColor,
                                                  fontFamily: FontResousrce
                                                      .DMSans_MEDIUM,
                                                  fontSize: 14.sp),
                                            ),
                                          )
                                        ],
                                      ),
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
            }
          }),
    );
  }
}
