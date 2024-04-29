import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';

class RangeSliderProperties extends StatefulWidget {
  const RangeSliderProperties({Key? key}) : super(key: key);

  @override
  _RangeSliderPropertiesState createState() => _RangeSliderPropertiesState();
}

class _RangeSliderPropertiesState extends State<RangeSliderProperties> {
  RangeValues _currentRangeValues = const RangeValues(4000, 8000);
  var minTxt = TextEditingController();
  var maxTxt = TextEditingController();

  @override
  void initState() {
    minTxt.text = " ₹ ${_currentRangeValues.start.round().toString()}";
    maxTxt.text = " ₹ ${_currentRangeValues.end.round().toString()}";
    super.initState();
  }

  @override
  void dispose() {
    // other dispose methods
    minTxt.dispose();
    maxTxt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 12.h,
        ),
        child: Column(
          children: [
            RangeSlider(
              values: _currentRangeValues,
              min: 500,
              max: 10000,
              activeColor: ColorResource.primaryColor,
              inactiveColor: ColorResource.offWhite,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                  minTxt.text =
                      " ₹ ${_currentRangeValues.start.round().toString()}";
                  maxTxt.text =
                      " ₹ ${_currentRangeValues.end.round().toString()}";
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 135.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: TextField(
                          controller: minTxt,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter text',
                          ),
                          style: const TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(width: 20.w, child: const Divider()),
                  Container(
                    width: 135.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: TextField(
                        controller: maxTxt,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter text',
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 140.w,
                  height: 16.h,
                  child: Center(
                    child: Text(
                      "Minimum",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontResousrce.DMSans_MEDIUM,
                          fontSize: 12.sp),
                    ),
                  ),
                ),
                SizedBox(
                  width: 140.w,
                  height: 16.h,
                  child: Center(
                    child: Text(
                      "Maximum",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontResousrce.DMSans_MEDIUM,
                          fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
