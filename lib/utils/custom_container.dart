import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/contants.dart';
import 'package:mg/utils/color_resources.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.containercontent});

  Widget containercontent;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        child: Container(
          width: width,
          color: ColorResource.white,
          child: SingleChildScrollView(
            child: containercontent,
          ),
        ),
      ),
    );
  }
}
