import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/common/uidata.dart';
import 'package:mg/screens/home/ui/based_on_amenities_widget.dart';
import 'package:mg/utils/color_resources.dart';

class SelectSeats extends StatefulWidget {
  const SelectSeats({Key? key}) : super(key: key);

  @override
  _SelectSeats createState() => _SelectSeats();
}

class _SelectSeats extends State<SelectSeats> {
  RangeValues _currentRangeValues = const RangeValues(4000, 8000);
  var minTxt = TextEditingController();
  var maxTxt = TextEditingController();

  int _selectedIndex = 0;

// Sample list of items
  List<String> items = [
    ' 1 ',
    ' 2 ',
    ' 3 ',
    ' 4 ',
    ' 5 ',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 280.w,
              height: 44.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(items!.length, (i) {
                  var itemsProperties = items[i];
                  return Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Container(
                          height: 32.h,
                          width: 43.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(18.0.r),
                          ),
                          child: Center(
                            child: Text(
                              itemsProperties,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          )));
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, top: 15.h, bottom: 8.h),
              child: Container(
                width: 90.w,
                height: 44.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: TextField(
                      controller: minTxt,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '1',
                      ),
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            )
          ],
        ));
  }
}
