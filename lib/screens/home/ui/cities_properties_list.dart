import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/cities_properties_widget.dart';

class CitiesProperties extends StatelessWidget {
  const CitiesProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      padding: EdgeInsets.only(top: 20.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurant.length, (i) {
          var citiesList = cities[i];
          return CitiesPropertiesWidget(
              image: citiesList['imageUrl'], title: citiesList['title']);
        }),
      ),
    );
  }
}
