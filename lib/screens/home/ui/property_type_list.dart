import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/property_type_widget.dart';

class PropertiesTypeList extends StatelessWidget {
  const PropertiesTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.h),
      height: 120.h * propertyType.length / 3,
      width: double.infinity,
      child: GridView.builder(
          padding: EdgeInsets.all(15),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5, // reduce or increase as per your requirement
            crossAxisSpacing:
                1, // spacing between columns// number of items in each row
          ),
          itemCount: propertyType.length, // total number of items
          itemBuilder: (context, index) {
            var propertyTypeList = propertyType[index];
            return PropertyTypeWidget(title: propertyTypeList['title']);
          }),
    );
  }
}
