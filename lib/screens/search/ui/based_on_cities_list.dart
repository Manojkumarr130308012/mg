import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/shimmers/popular_places.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/screens/search/ui/based_on_cities_widget.dart';

class AllCitiesProperties extends StatelessWidget {
  const AllCitiesProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h * cities!.length / 4,
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
          itemCount: cities!.length, // total number of items
          itemBuilder: (context, index) {
            var citiesList = cities[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AllCitiesWidget(
                  image: citiesList['imageUrl'], title: citiesList['title']),
            );
          }),
    );
  }
}
