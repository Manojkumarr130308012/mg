import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/filter_amenities_widget.dart';

class AmenitiesLists extends StatefulWidget {
  const AmenitiesLists({super.key});

  @override
  State<AmenitiesLists> createState() => _AmenitiesListsState();
}

class _AmenitiesListsState extends State<AmenitiesLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h * amenitiesType.length / 3,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.5),
          itemCount: amenitiesType.length, // total number of items
          itemBuilder: (context, index) {
            var amenitiesTypeList = amenitiesType[index];
            return AmenitiesListWidgets(
              title: amenitiesTypeList['title'],
              isSelected: amenitiesTypeList['isSelected'],
              icon: amenitiesTypeList['icon'],
            );
          }),
    );
  }
}
