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
  var seatTxt = TextEditingController();

  int _selectedIndex = 0;
// Sample list of items
  List<dynamic> items = [
    {"_id": "", "title": "1", "isSelected": false},
    {"_id": "", "title": "2", "isSelected": false},
    {"_id": "", "title": "3", "isSelected": false},
    {"_id": "", "title": "4", "isSelected": false},
    {"_id": "", "title": "5", "isSelected": false}
  ];

  @override
  void initState() {
    seatTxt.text = " ₹ ${items[_selectedIndex]['title']}";
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
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = i;
                            seatTxt.text =
                                "  ${items[_selectedIndex]['title']}";
                          });
                        },
                        child: Container(
                            height: 32.h,
                            width: 43.w,
                            decoration: BoxDecoration(
                              color: _selectedIndex == i
                                  ? ColorResource.primaryColor
                                  : ColorResource.white,
                              border: _selectedIndex == i
                                  ? Border.all(
                                      color: ColorResource.primaryColor)
                                  : Border.all(color: ColorResource.lightGrey),
                              borderRadius: BorderRadius.circular(18.0.r),
                            ),
                            child: Center(
                              child: Text(
                                "${itemsProperties['title']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: _selectedIndex == i
                                        ? ColorResource.white
                                        : ColorResource.dark,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ));
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, top: 15.h, bottom: 8.h),
              child: Container(
                width: 90.w,
                height: 44.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorResource.primaryColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: TextField(
                      controller: seatTxt,
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
