import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/resource_type_widget.dart';

class ResourceTypeList extends StatelessWidget {
  const ResourceTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102.h * resourceType.length / 3,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.5),
          itemCount: resourceType.length, // total number of items
          itemBuilder: (context, index) {
            var resourceTypeList = resourceType[index];
            return ResourceTypeWidgets(
                title: resourceTypeList['title'],
                isSelected: resourceTypeList['isSelected']);
          }),
    );
  }
}
