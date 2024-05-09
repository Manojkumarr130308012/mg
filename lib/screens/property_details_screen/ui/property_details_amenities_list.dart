import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/property_details_screen/ui/property_details_amenities_widget.dart';
import 'package:mg/screens/property_details_screen/model/propertyDetailsInfo.dart';
import 'package:mg/utils/contants.dart';

class PropertyDetailsAmenities extends StatelessWidget {
  PropertyDetailsAmenities({super.key, required this.amenitiesList});
  final List<PropertyAmenities>? amenitiesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h * (amenitiesList?.length ?? 0) / 3,
      width: double.infinity,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // number of items in each row
            mainAxisSpacing: 9.h, // spacing between rows
            crossAxisSpacing: 9.w, // spacing between columns
            childAspectRatio: 1.2,
          ),
          itemCount: amenitiesList?.length ?? 0, // total number of items
          itemBuilder: (context, index) {
            PropertyAmenities? amenities = amenitiesList![index];
            return PropertyDetailsAmenitiesWidget(
                image: "${Constants.basePath}${amenities?.iconPath}",
                title: '${amenities?.amenityName}');
          }),
    );
  }
}
