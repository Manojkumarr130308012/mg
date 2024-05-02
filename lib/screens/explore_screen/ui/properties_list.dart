import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/explore_screen/ui/properties_widget.dart';
import 'package:mg/screens/home/model/PropertiesList.dart';
import 'package:mg/utils/contants.dart';

class Properties extends StatelessWidget {
  const Properties({super.key, required this.propertiesList});
  final List<Data> propertiesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80.h),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(propertiesList.length, (i) {
          Data popularProperties = propertiesList[i];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: PropertiesWidget(
                image: popularProperties?.images != null &&
                        popularProperties.images!.isNotEmpty
                    ? "${Constants.basePath}${popularProperties.images![0]?.imagePath}" ??
                        ''
                    : '',
                logo: popularProperties?.images != null &&
                        popularProperties.images!.isNotEmpty
                    ? "${Constants.basePath}${popularProperties.images![0]?.imagePath}" ??
                        ''
                    : '',
                title: popularProperties?.propertyName ?? '',
                rate: popularProperties?.leastPlanPrice?.price ?? 0,
                rating: 5,
                address: popularProperties?.city?.name ?? '',
                icon: popularProperties?.propertyAmenities ?? [],
                unit: popularProperties?.leastPlanPrice?.unit ?? ""),
          );
        }),
      ),
    );
  }
}
