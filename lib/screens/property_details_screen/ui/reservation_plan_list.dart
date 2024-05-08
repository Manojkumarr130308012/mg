import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/property_details_screen/ui/reservation_plan_widget.dart';

class ReservationPlan extends StatelessWidget {
  const ReservationPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 259.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return const ReservationPlanWidget(
            image:
                'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
            title: "3 Seater Meeting room",
            plans: 'Hourly plan',
            price: '1200',
            offer: '15',
            isSelected: true,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 15.w);
        },
        itemCount: 3,
      ),
    );
  }
}
