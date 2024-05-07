import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/filter_amenities_widget.dart';
import 'package:mg/screens/home/model/AmenitiesList.dart';
import 'package:mg/utils/contants.dart';

class AmenitiesLists extends StatefulWidget {
  const AmenitiesLists({super.key, required this.amenitiesListes});
  final List<Datas> amenitiesListes;

  @override
  State<AmenitiesLists> createState() => _AmenitiesListsState();
}

class _AmenitiesListsState extends State<AmenitiesLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h * amenities.length / 3,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.5),
          itemCount: widget.amenitiesListes.length, // total number of items
          itemBuilder: (context, index) {
            Datas amenitiesList = widget.amenitiesListes[index];
            return AmenitiesListWidgets(
              id: (amenitiesList?.id ?? '').toString(),
              title: amenitiesList?.amenityName ?? '',
              isSelected: amenitiesList?.isSelected ?? false,
              icon: "${Constants.basePath}${amenitiesList.iconPath}",
            );
          }),
    );
  }
}
