import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent extends BaseEquatable {}

class HomeInitialEvent extends HomeEvent {
  BuildContext? context;
  dynamic arguments;

  HomeInitialEvent({this.context});
}
