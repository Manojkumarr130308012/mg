import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PropertyDetailsEvent extends BaseEquatable {}

class PropertyDetailsInitialEvent extends PropertyDetailsEvent {
  BuildContext? context;
  dynamic arguments;

  PropertyDetailsInitialEvent({this.context});
}

class PropertyInfoEvent extends PropertyDetailsEvent {
  BuildContext? context;
  dynamic arguments;

  PropertyInfoEvent({this.context, this.arguments});
}
