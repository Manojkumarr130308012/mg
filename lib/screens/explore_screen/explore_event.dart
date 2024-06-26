import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ExploreEvent extends BaseEquatable {}

class ExploreInitialEvent extends ExploreEvent {
  BuildContext? context;
  dynamic arguments;

  ExploreInitialEvent({this.context});
}

class PropertyListEvent extends ExploreEvent {
  BuildContext? context;
  dynamic arguments;

  PropertyListEvent({this.context, this.arguments});
}

class LikeEvent extends ExploreEvent {
  BuildContext? context;
  dynamic arguments;

  LikeEvent({this.context, this.arguments});
}
