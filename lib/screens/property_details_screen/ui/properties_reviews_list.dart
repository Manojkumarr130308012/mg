import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/property_details_screen/ui/properties_reviews_widget.dart';
import 'package:mg/utils/color_resources.dart';

class PropertiesReviews extends StatelessWidget {
  const PropertiesReviews({super.key});
  // final List<Data> propertiesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 163.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ColorResource.dark.withOpacity(0.2))),
            child: const PropertiesReviewsWidget(
              image:
                  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              descriptions: "null",
              name: 'Salman',
              date: '10.12.1995',
              rate: 4,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 15.w);
        },
      ),
    );
  }
}
