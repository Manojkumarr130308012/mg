import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/home/model/PropertiesList.dart';
import 'package:mg/screens/home/ui/latest_properties_widget.dart';

import '../../../utils/contants.dart';

class LatestProperties extends StatelessWidget {
  const LatestProperties({super.key, required this.propertiesList});
  final List<Data> propertiesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      padding: EdgeInsets.only(top: 2.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(propertiesList.length, (i) {
          Data popularProperties = propertiesList[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LatestPropertiesWidget(
              image: popularProperties.images != null &&
                      popularProperties.images!.isNotEmpty
                  ? "${Constants.basePath}${popularProperties.images![0].imagePath}"
                  : '',
              logo: popularProperties.images != null &&
                      popularProperties.images!.isNotEmpty
                  ? "${Constants.basePath}${popularProperties.images![0].imagePath}"
                  : '',
              title: popularProperties.propertyName ?? '',
              rate: popularProperties.leastPlanPrice?.price ?? 0,
              rating: 5,
              address: popularProperties.city?.name ?? '',
              unit: popularProperties.leastPlanPrice?.unit ?? '',
            ),
          );
        }),
      ),
    );
  }
}
