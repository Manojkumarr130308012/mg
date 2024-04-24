import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/explore_screen/ui/properties_widget.dart';

class Properties extends StatelessWidget {
  const Properties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(restaurant.length, (i) {
          var popularProperties = restaurant[i];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            child: PropertiesWidget(
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
