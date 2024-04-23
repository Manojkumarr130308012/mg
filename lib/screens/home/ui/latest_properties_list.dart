import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/popular_properties_widget.dart';

class LatestProperties extends StatelessWidget {
  const LatestProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      padding: EdgeInsets.only(top: 2.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurant!.length, (i) {
          var popularProperties = restaurant[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
