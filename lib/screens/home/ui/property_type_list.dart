import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/property_type_widget.dart';

class PropertiesTypeList extends StatelessWidget {
  const PropertiesTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h * propertyType.length / 3,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.5),
          itemCount: propertyType.length, // total number of items
          itemBuilder: (context, index) {
            var propertyTypeList = propertyType[index];
            return PropertyTypeWidgets(
              title: propertyTypeList['title'],
              isSelected: propertyTypeList['isSelected'],
            );
          }),
    );
  }
}
