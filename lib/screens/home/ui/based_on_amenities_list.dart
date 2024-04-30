import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/based_on_amenities_widget.dart';
import 'package:mg/screens/home/model/AmenitiesList.dart';
import 'package:mg/utils/contants.dart';

class BasedOnAmenitiesProperties extends StatelessWidget {
  const BasedOnAmenitiesProperties({super.key, required this.amenitiesListes});
  final List<Datas> amenitiesListes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h),
      height: 120.h * amenities.length / 4,
      width: double.infinity,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // number of items in each row
            mainAxisSpacing: 5.w, // spacing between rows
            crossAxisSpacing: 5.h, // spacing between columns
          ),
          itemCount: amenitiesListes.length, // total number of items
          itemBuilder: (context, index) {
            Datas amenitiesList = amenitiesListes[index];
            return BasedOnAmenitiesWidget(
                image: "${Constants.basePath}${amenitiesList.iconPath}",
                title: amenitiesList?.amenityName ?? '');
          }),
    );
  }
}
