import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BookingEvent extends BaseEquatable {}

class BookingsInitialEvent extends BookingEvent {
  BuildContext? context;
  dynamic arguments;

  BookingsInitialEvent({this.context});
}
