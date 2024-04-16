import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/login_page/login_screen.dart';

import '../../utils/color_resources.dart';
import '../../utils/image_resource.dart';

class SignUpSuccessScreen extends StatefulWidget {
  const SignUpSuccessScreen({super.key});

  @override
  State<SignUpSuccessScreen> createState() => _SignUpSuccessScreenState();
}

class _SignUpSuccessScreenState extends State<SignUpSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  child: Image.asset(
                    ImageResource.tick_green_anim,
                  ),
                ),
                Container(
                  child: Image.asset(
                    ImageResource.tick_bg_anim,
                    scale: 0.2,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10.h),
                  child: Text(
                    "Congratulations!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontFamily: FontResousrce.DMSans_SEMIBOLD),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.only(
                      left: 30.w, top: 15.h, right: 30.w, bottom: 10.h),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Registration was successfully completed. Please check your registrered email to verify account",
                    style: TextStyle(
                        color: ColorResource.lightGrey,
                        fontSize: 14.sp,
                        fontFamily: FontResousrce.DMSans_MEDIUM),
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.w, top: 10.h, right: 15.w, bottom: 10.h),
                  child: Container(
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: Center(
                        child: Text(
                          "Continue to login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: FontResousrce.DMSans_MEDIUM),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorResource.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
