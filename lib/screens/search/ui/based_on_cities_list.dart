import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/search/ui/based_on_cities_widget.dart';

class AllCitiesProperties extends StatelessWidget {
  const AllCitiesProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      height: 190.h * cities.length / 4,
      width: double.infinity,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // number of items in each row
            mainAxisSpacing: 5, // spacing between rows
            crossAxisSpacing: 5, // spacing between columns
          ),
          itemCount: cities.length, // total number of items
          itemBuilder: (context, index) {
            var citiesList = cities[index];
            return AllCitiesWidget(
                image: citiesList['imageUrl'], title: citiesList['title']);
          }),
    );
  }
}
