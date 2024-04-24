import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ExploreEvent extends BaseEquatable {}

class ExploreInitialEvent extends ExploreEvent {
  BuildContext? context;
  dynamic arguments;

  ExploreInitialEvent({this.context});
}
