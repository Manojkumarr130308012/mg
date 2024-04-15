import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/signup_screen/model/SignUpModel.dart';
import 'package:mg/screens/signup_screen/signup_bloc.dart';
import 'package:mg/screens/signup_screen/signup_event.dart';
import 'package:mg/screens/signup_success_screen/signup_success_screen.dart';
import 'package:mg/utils/color_resources.dart';

import '../../base/base_state.dart';
import '../../router.dart';
import '../../utils/contants.dart';
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

  bool passwordVisible = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  String _password = "";
  String _confirmpassword = "";

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SignUpBloc>(context);
  }

  RegisterUser(SignUpBloc bloc) async {
    final Map<String, dynamic> data = {
      "name":
          "${firstNameController.text.trim().toString()} ${lastNameController.text.trim().toString()}",
      "company_name": companyNameController.text.trim().toString(),
      "email": emailController.text.trim().toString(),
      "mobile_no": mobileController.text.trim().toString(),
      "password": passwordController.text.trim().toString(),
      "password_confirmation": confirmPasswordController.text.trim().toString(),
      "role": "Member"
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
                child: Text('New DAT8888888888888888888A'),
              );
            } else if (state is SuccessState) {
              if (state.successResponse is SignUpModel) {
                final SignUpModel response = state.successResponse;
                if (response.status == Constants.success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpSuccessScreen()),
                  );
                }
              }
            }
            return ScreenUtilInit(builder: (_, child) {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: ColorResource.primaryColor,
                  body: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(
                        ImageResource.banner,
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
                          child: Form(
                            key: _formkey,
                            autovalidateMode: _autoValidate,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 10.h),
                                  child: const Text(
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
                                    controller: firstNameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter First Name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(fontSize: 10.sp),
                                      floatingLabelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'First Name *',
                                        style: TextStyle(
                                            fontFamily:
                                                FontResousrce.DMSans_REGULAR,
                                            fontSize: 14.sp),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: ColorResource.primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    controller: lastNameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Last Name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(fontSize: 10.sp),
                                      floatingLabelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Last Name *',
                                        style: TextStyle(
                                            fontFamily:
                                                FontResousrce.DMSans_REGULAR,
                                            fontSize: 14.sp),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorResource.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    controller: companyNameController,
                                    decoration: InputDecoration(
                                      floatingLabelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Company Name (Optional)',
                                        style: TextStyle(
                                            fontFamily:
                                                FontResousrce.DMSans_REGULAR,
                                            fontSize: 14.sp),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorResource.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter email ID";
                                      } else if (!RegExp(
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                          .hasMatch(value)) {
                                        return "Enter valid email ID";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(fontSize: 10.sp),
                                      floatingLabelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Email ID *',
                                        style: TextStyle(
                                            fontFamily:
                                                FontResousrce.DMSans_REGULAR,
                                            fontSize: 14.sp),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorResource.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    controller: mobileController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter mobile number";
                                      } else if (value.length < 10) {
                                        return "Enter 10-digit mobile number";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(fontSize: 10.sp),
                                      floatingLabelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Mobile Number *',
                                        style: TextStyle(
                                            fontFamily:
                                                FontResousrce.DMSans_REGULAR,
                                            fontSize: 14.sp),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorResource.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
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
                                    onChanged: (value) {
                                      setState(() {
                                        _password = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(fontSize: 10.sp),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                        icon: Image.asset(
                                          passwordVisible == true
                                              ? ImageResource.eye_open
                                              : ImageResource.eye_slashed,
                                        ),
                                      ),
                                      floatingLabelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Password',
                                        style: TextStyle(
                                            fontFamily:
                                                FontResousrce.DMSans_REGULAR,
                                            fontSize: 14.sp),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorResource.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    controller: confirmPasswordController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter confirm password";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        _confirmpassword = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(fontSize: 10.sp),
                                      suffixIcon:
                                          (_password == _confirmpassword &&
                                                  _confirmpassword.isNotEmpty)
                                              ? IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                      ImageResource.tick_green),
                                                )
                                              : null,
                                      floatingLabelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Confirm Password',
                                        style: TextStyle(
                                            fontFamily:
                                                FontResousrce.DMSans_REGULAR,
                                            fontSize: 14.sp),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorResource.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
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
                                      onPressed: () {
                                        if (_formkey.currentState!.validate()) {
                                          RegisterUser(bloc);
                                          return;
                                        } else {
                                          setState(() => _autoValidate =
                                              AutovalidateMode.always);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorResource.primaryColor),
                                      child: Center(
                                        child: Text(
                                          "Continue",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontFamily:
                                                  FontResousrce.DMSans_MEDIUM),
                                        ),
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
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  AppRoutes.loginScreen);
                                            },
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
                                              color: ColorResource.primaryColor,
                                              fontFamily:
                                                  FontResousrce.DMSans_MEDIUM,
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
