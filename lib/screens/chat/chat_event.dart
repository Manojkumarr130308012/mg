import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ChatEvent extends BaseEquatable {}

class ChatInitialEvent extends ChatEvent {
  BuildContext? context;
  dynamic arguments;

  ChatInitialEvent({this.context});
}
