import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/popular_properties_widget.dart';

class PopularProperties extends StatelessWidget {
  const PopularProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurant.length, (i) {
          var popularProperties = restaurant[i];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            child: PopularPropertiesWidget(
                image: popularProperties['imageUrl'],
                logo: popularProperties['logourl'],
                title: popularProperties['title'],
                rate: popularProperties['rate'],
                rating: popularProperties['rating'],
                address: popularProperties['coords']['address']),
          );
        }),
      ),
    );
  }
}
