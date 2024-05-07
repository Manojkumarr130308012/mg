import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/resource_type_widget.dart';
import 'package:mg/screens/home/model/MeetingResourceGroup.dart';
import 'package:mg/utils/singleton.dart';

class ResourceTypeList extends StatefulWidget {
  const ResourceTypeList({super.key, required this.ResourceResultsLists});
  final List<ResourceResults> ResourceResultsLists;

  @override
  _ResourceTypeListListState createState() => _ResourceTypeListListState();
}

class _ResourceTypeListListState extends State<ResourceTypeList> {
  int? _selectedIndex;

  void _handleItemTap(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = null; // Deselect if already selected
      } else {
        _selectedIndex = index; // Select the tapped item
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h * widget.ResourceResultsLists.length / 3,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.5),
          itemCount: widget.ResourceResultsLists.length,
          itemBuilder: (context, index) {
            ResourceResults resourceResults =
                widget.ResourceResultsLists[index];
            return ResourceTypeWidget(
              id: (resourceResults?.id ?? '').toString(),
              title: resourceResults?.resourceGroupName ?? '',
              isSelected: index == _selectedIndex,
              onTap: () =>
                  _handleItemTap(widget.ResourceResultsLists[index].id!),
            );
          }),
    );
  }
}
