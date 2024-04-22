import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/shimmers/popular_places.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/screens/home/ui/based_on_amenities_widget.dart';

class BasedOnAmenitiesProperties extends StatelessWidget {
  const BasedOnAmenitiesProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h * amenities!.length / 4,
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.h),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // number of items in each row
            mainAxisSpacing: 12.0, // spacing between rows
            crossAxisSpacing: 12.0, // spacing between columns
          ),
          padding: EdgeInsets.all(8.0), // padding around the grid
          itemCount: amenities!.length, // total number of items
          itemBuilder: (context, index) {
            var amenitiesList = amenities[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: BasedOnAmenitiesWidget(
                  image: amenitiesList['imageUrl'],
                  title: amenitiesList['title']),
            );
          }),
    );
  }
}
