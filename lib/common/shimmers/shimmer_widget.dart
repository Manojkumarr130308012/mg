import 'package:flutter/material.dart';
import 'package:mg/utils/contants.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget(
      {super.key,
      required this.shimmerWidth,
      required this.shimmerHieght,
      required this.shimmerRadius});

  final double shimmerWidth;
  final double shimmerHieght;
  final double shimmerRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: shimmerWidth,
      height: shimmerHieght,
      padding: const EdgeInsets.only(right: 12, top: 8.0),
      child: _buildShimmerLine(
          height: shimmerHieght - 20,
          width: shimmerWidth - 15,
          radius: shimmerRadius),
    );
  }
}

Widget _buildShimmerLine(
    {required double height, required double width, required double radius}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: ColorResource.secondaryLight,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(radius)),
    ),
  );
}
