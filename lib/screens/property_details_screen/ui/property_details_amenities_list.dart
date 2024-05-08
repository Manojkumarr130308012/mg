import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/property_details_screen/ui/property_details_amenities_widget.dart';
import 'package:mg/utils/image_resource.dart';

class PropertyDetailsAmenitiesProperties extends StatelessWidget {
  const PropertyDetailsAmenitiesProperties({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h),
      height: 120.h * 7 / 3,
      width: double.infinity,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // number of items in each row
            mainAxisSpacing: 5.w, // spacing between rows
            crossAxisSpacing: 5.h, // spacing between columns
          ),
          itemCount: 7, // total number of items
          itemBuilder: (context, index) {
            return PropertyDetailsAmenitiesWidget(
                image: ImageResource.meeting_room, title: 'Check');
          }),
    );
  }
}
