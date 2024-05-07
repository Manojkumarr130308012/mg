import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/property_type_widget.dart';
import 'package:mg/screens/home/model/PropertyTypeList.dart';
import 'package:mg/utils/singleton.dart';

class PropertiesTypeList extends StatefulWidget {
  const PropertiesTypeList({super.key, required this.PropertiesTypeLists});
  final List<PropertyTypeDataDataList> PropertiesTypeLists;

  @override
  _PropertiesTypeListState createState() => _PropertiesTypeListState();
}

class _PropertiesTypeListState extends State<PropertiesTypeList> {
  int? _selectedIndex;

  void _handleItemTap(int index) {
    print("object ${index}");
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = null; // Deselect if already selected
      } else {
        _selectedIndex = index; // Select the tapped item
      }
      FlashSingleton.instance
          .addPropertyId(widget.PropertiesTypeLists[index]!.id!);
      print(FlashSingleton.instance.propertyIdArray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h * widget.PropertiesTypeLists.length / 3,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.5),
          itemCount: widget.PropertiesTypeLists.length,
          itemBuilder: (context, index) {
            PropertyTypeDataDataList propertyTypeList =
                widget.PropertiesTypeLists[index];
            return PropertyTypeWidgets(
              id: (propertyTypeList?.id ?? '').toString(),
              title: propertyTypeList?.propertyTypeName ?? '',
              isSelected: index == _selectedIndex,
              onTap: () => _handleItemTap(index),
            );
          }),
    );
  }
}
