import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

abstract class ProfileEvent extends BaseEquatable {}

class ProfileInitialEvent extends ProfileEvent {
  BuildContext? context;
  dynamic arguments;

  ProfileInitialEvent({this.context});
}
