import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FavoriteEvent extends BaseEquatable {}

class FavoritesInitialEvent extends FavoriteEvent {
  BuildContext? context;
  dynamic arguments;

  FavoritesInitialEvent({this.context});
}

// class PropertyListEvent extends FavoriteEvent {
//   BuildContext? context;
//   dynamic arguments;
//
//   PropertyListEvent({this.context, this.arguments});
// }
