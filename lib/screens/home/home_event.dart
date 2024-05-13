import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent extends BaseEquatable {}

class HomeInitialEvent extends HomeEvent {
  BuildContext? context;
  dynamic arguments;

  HomeInitialEvent({this.context});
}

class PropertyListEvent extends HomeEvent {
  BuildContext? context;
  dynamic arguments;

  PropertyListEvent({this.context, this.arguments});
}

class AmenitiesListEvent extends HomeEvent {
  BuildContext? context;

  AmenitiesListEvent({this.context});
}

class PropertyTypeListEvent extends HomeEvent {
  BuildContext? context;

  PropertyTypeListEvent({this.context});
}

class MeetingResourceGroupListEvent extends HomeEvent {
  BuildContext? context;

  MeetingResourceGroupListEvent({this.context});
}

class LikeEvent extends HomeEvent {
  BuildContext? context;
  dynamic arguments;

  LikeEvent({this.context, this.arguments});
}
