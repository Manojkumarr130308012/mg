import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/based_on_amenities_widget.dart';

class BasedOnAmenitiesProperties extends StatelessWidget {
  const BasedOnAmenitiesProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h),
      height: 110.h * amenities.length / 4,
      width: double.infinity,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // number of items in each row
            mainAxisSpacing: 5.w, // spacing between rows
            crossAxisSpacing: 5.h, // spacing between columns
          ),
          itemCount: amenities.length, // total number of items
          itemBuilder: (context, index) {
            var amenitiesList = amenities[index];
            return BasedOnAmenitiesWidget(
                image: amenitiesList['imageUrl'],
                title: amenitiesList['title']);
          }),
    );
  }
}
