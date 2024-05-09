import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';

enum HourPickerHourState { START, MIDDLE, END, EMPTY }

class HourPickerSingleHour extends StatelessWidget {
  final double START_END_CIRCLE_RADIUS = 20;
  final double START_END_PERIOD_MARGIN = 20;

  final HourPickerHourState state;
  final String timeHeader;
  final String dateParam;
  final String dateTime;
  final bool hoursAvailability;

  const HourPickerSingleHour(this.state, this.timeHeader, this.dateParam,
      this.dateTime, this.hoursAvailability);

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = EdgeInsets.only(
      left: state == HourPickerHourState.START ? START_END_PERIOD_MARGIN : 0,
      right: state == HourPickerHourState.END ? START_END_PERIOD_MARGIN : 0,
      bottom: 0,
      top: 0,
    );
    Color backgroundColor = state == HourPickerHourState.EMPTY
        ? Colors.transparent
        : ColorResource.primaryColor.withOpacity(0.2);
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: state == HourPickerHourState.START
                ? Radius.circular(START_END_CIRCLE_RADIUS)
                : Radius.circular(0),
            bottomLeft: state == HourPickerHourState.START
                ? Radius.circular(START_END_CIRCLE_RADIUS)
                : Radius.circular(0),
            topRight: state == HourPickerHourState.END
                ? Radius.circular(START_END_CIRCLE_RADIUS)
                : Radius.circular(0),
            bottomRight: state == HourPickerHourState.END
                ? Radius.circular(START_END_CIRCLE_RADIUS)
                : Radius.circular(0),
          )),
      alignment: Alignment.center,
      child: Text(
        timeHeader,
        key: Key('text_dayHour_${dateParam}_$dateTime'),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: FontResousrce.DMSans_REGULAR,
            fontSize: 12.sp,
            color: hoursAvailability
                ? Colors.black
                : Colors.grey.withOpacity(0.5)),
      ),
    );
  }
}
