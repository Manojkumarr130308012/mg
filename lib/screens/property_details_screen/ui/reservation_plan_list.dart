import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/property_details_screen/ui/reservation_plan_widget.dart';
import 'package:mg/screens/property_details_screen/model/propertyDetailsInfo.dart';
import 'package:mg/utils/contants.dart';

class ReservationPlan extends StatelessWidget {
  const ReservationPlan({super.key, required this.reservationPlans});
  final List<ResourcePlan>? reservationPlans;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 259.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          ResourcePlan? resourcePlan = reservationPlans![index];
          return ReservationPlanWidget(
            image:
                '${Constants.basePath}${resourcePlan?.imagePath![0].imagePaths}',
            title: "${resourcePlan.planName}",
            plans: '${resourcePlan.unit} plan',
            price: '${resourcePlan.price}',
            offer: '',
            isSelected: false,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 15.w);
        },
        itemCount: reservationPlans?.length ?? 0,
      ),
    );
  }
}
