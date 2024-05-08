import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/property_details_screen/ui/property_details_amenities_widget.dart';

class PropertyDetailsAmenities extends StatelessWidget {
  const PropertyDetailsAmenities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h * 6 / 3,
      width: double.infinity,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // number of items in each row
            mainAxisSpacing: 9.h, // spacing between rows
            crossAxisSpacing: 9.w, // spacing between columns
            childAspectRatio: 1.2,
          ),
          itemCount: 6, // total number of items
          itemBuilder: (context, index) {
            return const PropertyDetailsAmenitiesWidget(
                image:
                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                title: 'images.unsplash.com photo');
          }),
    );
  }
}
