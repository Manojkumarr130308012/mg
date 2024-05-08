import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/property_details_screen/ui/property_details_amenities_widget.dart';
import 'package:mg/utils/image_resource.dart';

class PropertyDetailsAmenities extends StatelessWidget {
  const PropertyDetailsAmenities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h * 7 / 3,
      width: double.infinity,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // number of items in each row
            mainAxisSpacing: 9.h, // spacing between rows
            crossAxisSpacing: 9.w, // spacing between columns
          ),
          itemCount: 7, // total number of items
          itemBuilder: (context, index) {
            return PropertyDetailsAmenitiesWidget(
                image: ImageResource.meeting_room, title: 'Check');
          }),
    );
  }
}
