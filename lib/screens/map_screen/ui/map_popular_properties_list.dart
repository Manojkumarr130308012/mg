import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';

import 'map_popular_properties_widget.dart';

class MapPopularProperties extends StatelessWidget {
  const MapPopularProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 90.h,
      child: SizedBox(
        height: 121.h,
        width: 393.w,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(restaurant.length, (i) {
            var popularProperties = restaurant[i];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              child: MapPopularPropertiesWidget(
                  image: popularProperties['imageUrl'],
                  logo: popularProperties['logourl'],
                  title: popularProperties['title'],
                  rate: popularProperties['rate'],
                  rating: popularProperties['rating'],
                  address: popularProperties['coords']['address']),
            );
          }),
        ),
      ),
    );
  }
}
