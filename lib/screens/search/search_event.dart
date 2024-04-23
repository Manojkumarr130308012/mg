import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SearchEvent extends BaseEquatable {}

class SearchInitialEvent extends SearchEvent {
  BuildContext? context;
  dynamic arguments;

  SearchInitialEvent({this.context});
}
