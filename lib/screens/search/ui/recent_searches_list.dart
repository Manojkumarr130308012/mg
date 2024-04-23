import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/shimmers/popular_places.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/screens/search/ui/recent_searches_widget.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: restaurant.length * 40,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(restaurant!.length, (i) {
          var popularProperties = restaurant[i];
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: RecentSearchesWidget(
                address: popularProperties['coords']['address']),
          );
        }),
      ),
    );
  }
}
